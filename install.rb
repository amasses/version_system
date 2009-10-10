require 'ftools'

@rails_root = "../../../"

# Install hook code here


git_hook = "#{@rails_root}/.git/hooks/pre-commit"
lines = [
    %{ruby -e 'require "yaml"; vars = YAML::load_file("config/version.yml"); vars[:rel_date] = DateTime.now; vars[:year] = vars[:rel_date].year; vars[:revision] = vars[:revision] + 1; File.open("config/version.yml", "w") { |fo| YAML::dump(vars, fo)}'},
    %{echo "Updated version information"},
    %{git add config/version.yml}
  ]

File.copy("config/version.yml", "#{@rails_root}/config/version.yml")

if !File.exists?(git_hook)
  lines.insert(0, "#!/bin/sh")
end

puts "Adding pre-commit hooks"
# Add to existing.
File.open(git_hook, "a") do |file|
  lines.each do |line|
    file.write(line + "\n")
  end
end

system("chmod +x #{git_hook}")

puts "Done now"
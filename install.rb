require 'ftools'

# Install hook code here
git_hook = "#{RAILS_ROOT}/.git/hooks/pre-commit"

File.copy(File.dirname(__FILE__) + "/config/version.yml", "#{RAILS_ROOT}/config/version.yml")

if !File.exists?(git_hook)
 new_file = true

end

puts "Adding pre-commit hooks"
# Add to existing.
File.open(git_hook, "a") do |file|
  file.write "#!/bin/sh\n" if new_file
  file.write "script/runner vendor/plugins/version_system/lib/increment_version.rb"
end

system("chmod +x #{git_hook}")

puts "Done now"
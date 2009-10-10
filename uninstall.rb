# require 'ftools'
# 
# lines = [
#     "ruby -e 'require \"yaml\"; vars = YAML::load_file(\"config/version.yml\"); vars[:rel_date] = DateTime.now; vars[:year] = vars[:rel_date].year; vars[:revision] = vars[:revision] + 1; File.open(\"config/version.yml\", \"w\") { |fo| YAML::dump(vars, fo)}'",
#     "echo \"Updated version information\"",
#     "git add config/version.yml"
#   ]
#   
# File.delete("../../../config/version.yml") if File.exists?("../../../config/version.yml")
# 
# if File.exists?("../../../.git/hooks/pre-commit")
#   f_lines = IO.readlines("../../../.git/hooks/pre-commit")
#   puts "Lines in pre-commit hook: #{f_lines.size}"
# 
#   File.delete("../../../.git/hooks/pre-commit")
#   
#   File.open("../../../.git/hooks/pre-commit", "a") do |file|
#     f_lines.each do |fl|
#       puts "Current line: #{fl}"
#       unless lines.include?(fl + "\n")
#         puts "Not in there!"
#         file.write(fl)
#       end
#     end
#   end
# 
# end
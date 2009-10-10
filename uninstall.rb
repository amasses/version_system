require 'ftools'

ver_file = "#{RAILS_ROOT}/config/version.yml"
hook_file = "#{RAILS_ROOT}/.git/hooks/pre-commit"

File.delete(ver_file) if File.exists?(ver_file)
 
 
if File.exists?(hook_file)
  f_lines = IO.readlines(hook_file)
  puts "Lines in pre-commit hook: #{f_lines.size}"

  File.delete(hook_file)
  
  File.open(hook_fiile, "a") do |file|
    f_lines.each do |fl|
      puts "Current line: #{fl}"
      unless fl == "../../script/runner vendor/plugins/version_system/lib/increment_version.rb"
        file.write(fl)
      end
    end
  end
end

puts "Uninstall Complete - I hope :)"
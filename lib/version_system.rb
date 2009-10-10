require 'ostruct'
ver_path = "#{File.dirname(__FILE__)}/../version.yml"

#loads the version YAML file and creates an APP_VERSION struct from that hash for access
if File.exists?(ver_path)
  APP_VERSION = OpenStruct.new(YAML::load_file(ver_path))
else
  APP_VERSION = OpenStruct.new({ :year => DateTime.now.year, :revision => 1, :rel_date => DateTime.now })
end

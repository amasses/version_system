ver_path = "#{File.dirname(__FILE__)}/../version.yml"

vars = YAML::load_file(ver_path)

vars[:rel_date] = DateTime.now
vars[:year] = vars[:rel_date].year
vars[:revision] = vars[:revision] + 1

File.open(ver_path, "w") do |fo|
  YAML::dump(vars, fo)
end
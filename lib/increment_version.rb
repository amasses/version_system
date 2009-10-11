ver_path = "#{RAILS_ROOT}/config/version.yml"

vars = YAML::load_file(ver_path)

vars[:rel_date] = Time.now
vars[:year] = Date.today.year
vars[:revision] = vars[:revision] + 1

File.open(ver_path, "w") do |fo|
  YAML::dump(vars, fo)
end

exec "git add #{ver_path}"
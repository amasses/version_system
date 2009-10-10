module ViewHelpers
  def version_number
    "#{APP_VERSION.year}.#{APP_VERSION.revision} (released: #{APP_VERSION.rel_date})"
  end
end
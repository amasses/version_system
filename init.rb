require 'version_system'

return if ActionView::Base.instance_methods.include_method? :version_number
require 'version_system_helper'
ActionView::Base.send :include, ViewHelpers
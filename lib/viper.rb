unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

require "viper/version"

Motion::Project::App.setup do |app|
  app.files += FileList[File.join(File.dirname(__FILE__), 'viper/**/*.rb')].to_a
end
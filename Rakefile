$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler/gem_tasks'
Bundler.setup
Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'ViperTest'
  app.version = "0.99.0"
  app.redgreen_style = :focused # :focused, :full

  # Devices
  app.deployment_target = "5.0"
  app.detect_dependencies = true
end

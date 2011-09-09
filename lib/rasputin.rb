require 'tilt'
require 'sprockets/engines'

require "rasputin/version"
require "rasputin/handlebars_template"
require "rasputin/spade_dependencies_processor"

module Rasputin
  class Engine < ::Rails::Engine
    initializer :setup_rasputin do |app|
      app.assets.register_preprocessor 'application/javascript', Rasputin::SpadeDependenciesProcessor
      app.assets.register_engine '.handlebars', Rasputin::HandlebarsTemplate
    end
  end
end

require 'rails/generators'

module RailsViewCounter
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)
    desc 'Generates Rails View Counter initializer'

    def copy_initializer
      template 'initializer.rb', 'config/initializers/rails_view_counter.rb'
    end

    private

    def source_paths
      [File.expand_path('../templates', __dir__)]
    end
  end
end
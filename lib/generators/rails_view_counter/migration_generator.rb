require 'rails/generators'

module RailsViewCounter
  class MigrationGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __dir__)
    desc 'Generates migration for adding view counter to a model'

    argument :table_name, type: :string, required: true, desc: 'Table name to add view counter to'

    def create_migration_file
      migration_file = File.join("db/migrate", "#{timestamp}_add_view_counter_to_#{table_name.singularize}.rb")
      template 'migration.rb', migration_file
    end

    private

    def source_paths
      [File.expand_path('../templates', __dir__)]
    end

    def timestamp
      Time.current.strftime("%Y%m%d%H%M%S")
    end
  end
end
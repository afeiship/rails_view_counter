require 'rails/generators'

module RailsViewCounter
  class MigrationGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __dir__)
    desc 'Generates migration for adding view counter to a model'

    argument :table_name, type: :string, desc: 'Table name to add view counter to'

    def create_migration_file
      migration_template 'migration.rb', 
                        "db/migrate/add_view_counter_to_#{table_name}.rb"
    end

    private

    def source_paths
      [File.expand_path('../templates', __dir__)]
    end
  end
end
require 'rails/generators'
require 'rails/generators/migration'

module RailsViewCounter
  class MigrationGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    
    source_root File.expand_path('../templates', __dir__)
    desc 'Generates migration for adding view counter to a model'

    argument :table_name, type: :string, required: true, desc: 'Table name to add view counter to'

    def create_migration_file
      # 确保表名是复数形式
      plural_table_name = table_name.pluralize
      migration_template 'migration.rb', 
                        "db/migrate/add_view_counter_to_#{plural_table_name}.rb"
    end

    private

    def source_paths
      [File.expand_path('../templates', __dir__)]
    end

    # 必需的方法：返回下一个可用的迁移版本号
    def self.next_migration_number(dirname)
      next_migration_number = current_migration_number(dirname) + 1
      ActiveRecord::Migration.next_migration_number(next_migration_number)
    end
  end
end
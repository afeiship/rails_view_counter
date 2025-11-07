class RailsViewCounterMigrationGenerator < Rails::Generators::Base
  def create_migration_file
    migration_template "migration.rb", "db/migrate/add_view_counter_to_#{table_name}.rb"
  end

  private

  def table_name
    @table_name ||= ask("Which table would you like to add view counter to?").underscore
  end
end
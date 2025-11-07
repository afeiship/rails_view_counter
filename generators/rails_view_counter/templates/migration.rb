class AddViewCounterTo<%= table_name.camelize %> < ActiveRecord::Migration[<%= ActiveRecord::Migration.current_version %>]
  def change
    add_column :<%= table_name %>, :view_count, :integer, default: 0
    add_index :<%= table_name %>, :view_count
  end
end
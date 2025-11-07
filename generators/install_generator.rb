# generators/install_generator.rb
class RailsViewCounterGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def copy_initializer
    template "initializer.rb", "config/initializers/rails_view_counter.rb"
  end

  def show_readme
    readme "README" if behavior == :invoke
  end
end
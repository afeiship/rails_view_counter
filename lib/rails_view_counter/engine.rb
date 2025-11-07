module RailsViewCounter
  class Engine < ::Rails::Engine
    isolate_namespace RailsViewCounter

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end

    initializer "rails_view_counter.active_record" do
      ActiveSupport.on_load :active_record do
        include RailsViewCounter::ModelAdditions
      end
    end

    initializer "rails_view_counter.action_controller" do
      ActiveSupport.on_load :action_controller do
        include RailsViewCounter::ControllerAdditions
      end
    end
  end
end
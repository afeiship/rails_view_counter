# lib/rails_view_counter/engine.rb
module RailsViewCounter
  class Engine < ::Rails::Engine
    isolate_namespace RailsViewCounter

    initializer "rails_view_counter.model" do
      ActiveSupport.on_load :active_record do
        include ModelAdditions
      end

      ActiveSupport.on_load :action_controller do
        include ControllerAdditions
      end
    end
  end
end
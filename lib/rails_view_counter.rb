require "rails_view_counter/version"
require "rails_view_counter/engine"
require "rails_view_counter/model_additions"
require "rails_view_counter/controller_additions"
require "rails_view_counter/configuration"

module RailsViewCounter
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
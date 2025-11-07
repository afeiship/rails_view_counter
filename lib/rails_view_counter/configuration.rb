# lib/rails_view_counter/configuration.rb
module RailsViewCounter
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Configuration
    attr_accessor :ip_limit_duration, :enable_ip_limit, :log_views, :cache_store

    def initialize
      @ip_limit_duration = 1.hour
      @enable_ip_limit = true
      @log_views = false
      @cache_store = :rails_cache
    end
  end
end
# lib/rails_view_counter/model_additions.rb
module RailsViewCounter
  module ModelAdditions
    extend ActiveSupport::Concern

    included do
      after_initialize :set_default_view_count, if: :new_record?
    end

    def increment_view_count!(ip_address = nil, options = {})
      return false unless view_counter_enabled?
      
      if ip_address && should_count_view?(ip_address, options)
        increment!(:view_count)
        log_view(ip_address) if log_views_enabled?
        true
      else
        false
      end
    end

    def can_increment_view_count?(ip_address, options = {})
      should_count_view?(ip_address, options)
    end

    private

    def set_default_view_count
      self.view_count ||= 0
    end

    def should_count_view?(ip_address, options = {})
      return true unless ip_address
      
      # 获取配置
      limit_duration = options[:limit_duration] || RailsViewCounter.configuration.ip_limit_duration
      enable_ip_limit = options[:enable_ip_limit] || RailsViewCounter.configuration.enable_ip_limit
      
      return true unless enable_ip_limit

      cache_key = generate_cache_key(ip_address)
      !Rails.cache.read(cache_key)
    end

    def generate_cache_key(ip_address)
      "#{self.class.name.downcase}_#{id}_#{normalize_ip(ip_address)}"
    end

    def normalize_ip(ip)
      ip.gsub(/[.:]/, '_')
    end

    def view_counter_enabled?
      # 可以根据配置决定是否启用
      true
    end

    def log_views_enabled?
      RailsViewCounter.configuration.log_views
    end

    def log_view(ip_address)
      ViewCounter::ViewLog.create!(
        viewable_type: self.class.name,
        viewable_id: id,
        ip_address: ip_address,
        user_agent: nil # 可以从控制器获取
      )
    end
  end
end
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
      
      # 检查该 IP 是否在限制时间内已经访问过
      if Rails.cache.read(cache_key)
        return false # 不允许增加浏览次数
      else
        # 设置缓存，有效期为限制时间
        Rails.cache.write(cache_key, true, expires_in: limit_duration)
        return true # 允许增加浏览次数
      end
    end

    def generate_cache_key(ip_address)
      "#{self.class.name.downcase}_#{id}_#{normalize_ip(ip_address)}"
    end

    def normalize_ip(ip)
      ip.gsub(/[.:]/, '_')
    end

    def view_counter_enabled?
      true
    end

    def log_views_enabled?
      RailsViewCounter.configuration.log_views
    end

    def log_view(ip_address)
      # 如果需要记录访问日志，这里可以实现
      # ViewCounter::ViewLog.create!(...)
    end
  end
end
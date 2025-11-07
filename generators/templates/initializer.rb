# generators/templates/initializer.rb
RailsViewCounter.configure do |config|
  # IP 限制时间间隔（默认1小时）
  config.ip_limit_duration = 1.hour

  # 是否启用 IP 限制
  config.enable_ip_limit = true

  # 是否记录详细访问日志
  config.log_views = false

  # 缓存存储方式
  config.cache_store = :rails_cache
end
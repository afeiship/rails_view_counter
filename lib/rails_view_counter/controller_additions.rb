module RailsViewCounter
  module ControllerAdditions
    extend ActiveSupport::Concern

    def increment_view_count!(viewable, options = {})
      ip_address = get_user_ip
      viewable.increment_view_count!(ip_address, options)
    end

    private

    def get_user_ip
      # 优先使用 X-Forwarded-For 头（用于负载均衡器或代理）
      forwarded_ips = request.headers['X-Forwarded-For']
      if forwarded_ips.present?
        # 取第一个 IP（客户端真实 IP）
        forwarded_ips.split(',').first.strip
      else
        # 直接使用 remote_ip
        request.remote_ip
      end
    end
  end
end
# lib/rails_view_counter/controller_additions.rb
module RailsViewCounter
  module ControllerAdditions
    extend ActiveSupport::Concern

    def increment_view_count!(viewable, options = {})
      ip_address = get_user_ip
      viewable.increment_view_count!(ip_address, options)
    end

    private

    def get_user_ip
      forwarded_ips = request.headers['X-Forwarded-For']
      if forwarded_ips.present?
        forwarded_ips.split(',').first.strip
      else
        request.remote_ip
      end
    end
  end
end
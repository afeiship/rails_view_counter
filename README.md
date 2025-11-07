# rails_view_counter
> rails plugin new rails_view_counter --mountable --full

## Usage
```sh
rails generate rails_view_counter:install
rails generate rails_view_counter:migration posts
rails db:migrate
```
```rb
# config/initializers/rails_view_counter.rb
RailsViewCounter.configure do |config|
  config.ip_limit_duration = 2.hours
  config.enable_ip_limit = true
  config.log_views = true
end


class Post < ApplicationRecord
  # 自动包含 ViewCounter::ModelAdditions
  validates :title, presence: true
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "rails_view_counter"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_view_counter
```

## Resources
- https://chat.qwen.ai/c/b1a1ea17-4937-48df-abf0-81be548e3d89

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

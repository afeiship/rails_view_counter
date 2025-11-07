require_relative "lib/rails_view_counter/version"

Gem::Specification.new do |spec|
  spec.name        = "rails_view_counter"
  spec.version     = RailsViewCounter::VERSION
  spec.authors     = [ "aric.zheng" ]
  spec.email       = [ "1290657123@qq.com" ]
  spec.homepage    = "https://js.work"
  spec.summary       = "A Rails gem for tracking and managing view counts with IP limiting."
  spec.description   = "A Rails gem for tracking and managing view counts with IP limiting and cache optimization."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ariczheng/rails_view_counter"
  spec.metadata["changelog_uri"] = "https://github.com/ariczheng/rails_view_counter/blob/main/CHANGELOG.md"
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib,generators}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.1.1"
end

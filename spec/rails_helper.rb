# spec/rails_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'factory_bot_rails'
require 'capybara/rspec'
require 'capybara/rails'

# Checks for pending migrations and applies them before tests are run.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Capybara::DSL, type: :feature
  config.include FactoryBot::Syntax::Methods
end

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. 
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

require 'database_cleaner'
require 'simplecov'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # Factory Girl
  config.include FactoryGirl::Syntax::Methods

  # Database cleaner
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning { example.run }
  end

  # Shoulda Matchers
  Shoulda::Matchers.configure do |cfg|
    cfg.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

   SimpleCov.start 'rails'
end

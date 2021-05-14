# frozen_string_literal: true

require "simplecov"
require "bundler"
require "pry"

SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter]
SimpleCov.minimum_coverage 70.0

SimpleCov.start do
  add_filter "/spec/"
  minimum_coverage 70
  minimum_coverage_by_file 50
end

Dir["./lib/**/*.rb"].sort.each { |file| require file }

begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems"

  exit e.status_code
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

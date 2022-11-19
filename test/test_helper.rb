ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "mocha/minitest"
require 'logger'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # -----------------------------------------------
  # stub very simply the response from faraday
  # -----------------------------------------------
  class MockFaradayResponse
    def initialize(status, data)
      @status = status
      @data = data
    end

    def status
      @status
    end

    def body
      @data.to_json
    end
  end
  # -----------------------------------------------
end

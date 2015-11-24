require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'sigiss'
require 'pry'
require 'vcr'
require 'helpers/helpers.rb'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.ignore_hosts 'codeclimate.com'
end

RSpec.configure do |config|

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include Helpers

end

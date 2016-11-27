require "simplecov"
SimpleCov.start

require "active_support/core_ext/string/strip"
require "ruboty"

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end

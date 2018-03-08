require "simplecov"
SimpleCov.start

require "active_support/core_ext/string/strip"
require "net/http"
require "ruboty"

ENV["RUBOTY_PORT"] ||= "3030"

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.before do
    allow_any_instance_of(Ruboty::Robot).to receive(:server)
    allow_any_instance_of(Ruboty::Robot).to receive(:route)
  end
end

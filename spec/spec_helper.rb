$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

FIXTURE_PATH = File.join(File.dirname(__FILE__), 'fixtures')

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Tag test with :focus metadata to run only those examples
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.disable_monkey_patching!

  config.warnings = true

  # Use detailed output if only running one test file
  config.default_formatter = 'doc' if config.files_to_run.one?

  config.order = :random
  Kernel.srand config.seed
end

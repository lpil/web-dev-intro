notification :off

# Only run the linter if tests pass
group :red_green_refactor, halt_on_fail: true do

  # Run all tests when any Ruby file changes
  guard :rspec, all_on_start: true, cmd: 'bundle exec rspec' do
    watch(/\.rb$/) { 'spec' }
  end

  # Lint all code when any Ruby file changes
  guard :rubocop do
    watch('Gemfile')
    watch(/\.rb$/)
  end
end

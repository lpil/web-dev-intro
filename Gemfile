source 'https://rubygems.org'

# Static site compiler
gem 'middleman', '>= 4.0.0'

# Syntax highlighting in views
gem 'middleman-syntax'

# Reload browser on changes
gem 'middleman-livereload'

# For faster file watcher updates on Windows:
gem 'wdm', '~> 0.1.0', platforms: [:mswin, :mingw]

# Windows does not come with time zone data
gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby]

# Markdown processor
gem 'redcarpet', '~> 2.3'


group :development, :test do
  # Test framework
  gem 'rspec', '~> 3.0'

  # Automatic test runner
  gem 'guard-rspec'
  gem 'guard-rubocop'

  # Linters
  gem 'rubocop'
  gem 'rubocop-rspec'

  # Lock rubocop parser to a specific version
  # https://github.com/bbatsov/rubocop/issues/1934
  gem 'parser', '~> 2.2.2.6'
end

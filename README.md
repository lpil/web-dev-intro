An Introduction to Web Dev
==========================

[![Build Status](https://travis-ci.org/lpil/web-dev-intro.svg?branch=master)](https://travis-ci.org/lpil/web-dev-intro)

With Ruby & Sinatra


## Development

```sh
# Install the deps
bundle install

# Run the tests
bundle exec rspec

# Run the linter
bundle exec rubocop

# Run the test watcher
bundle exec guard

# Run the compiler & server
bundle exec middleman server
```


## Adding a new tutorial

* Add a markdown file with the `.html.md` extension to `source/tutorials/` 
* Add an entry to `data/tutorials.yml`

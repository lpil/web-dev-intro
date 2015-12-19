###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml',  layout: false
page '/*.json', layout: false
page '/*.txt',  layout: false

activate :syntax

config[:markdown_engine] = :redcarpet
config[:markdown] = {
  fenced_code_blocks: true,
  smartypants: true,
}

config[:sass_assets_paths] = ['scss']

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload
end

require_relative 'lib/helpers/layout_helpers'

helpers LayoutHelpers

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end

activate :directory_indexes

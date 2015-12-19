require 'spec_helper'
require 'pathname'
require 'markdown_document'

RSpec.describe 'inline Ruby code' do
  markdown_pattern = File.join(ROOT_PATH, '**', '*.md')
  markdown_paths   = Dir.glob markdown_pattern

  markdown_paths.each do |path|
    rel_path = Pathname.new(path).relative_path_from(
      Pathname.new(ROOT_PATH),
    ).to_s

    source   = File.read path
    document = MarkdownDocument.new source: source, identifier: rel_path
    ruby_blocks = document.code_blocks.select(&:ruby?)

    ruby_blocks.each do |block|
      it "has valid syntax in #{block.identifier}" do
        expect(block.valid_syntax?).to eq true
      end
    end
  end
end

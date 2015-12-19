require 'spec_helper'
require 'markdown_document'
require 'code_block'

RSpec.describe MarkdownDocument do
  let(:markdown) do
    md_path = File.join(FIXTURE_PATH, 'redcarpet_code_extractor.md')
    File.read md_path
  end

  let(:document) { described_class.new source: markdown, identifier: 'foo.md' }

  it 'can report the identifier' do
    expect(document.identifier).to eq 'foo.md'
  end

  it 'can report the source' do
    expect(document.source).to eq markdown
  end

  it 'can extract code blocks' do
    block1 = CodeBlock.new(
      code: "1 + 1\n",
      language: 'ruby',
      identifier: 'Code block 1 in foo.md',
    )
    block2 = CodeBlock.new(
      code: "2 + 2\n",
      language: 'javascript',
      identifier: 'Code block 2 in foo.md',
    )
    expect(document.code_blocks).to eq [block1, block2]
  end
end

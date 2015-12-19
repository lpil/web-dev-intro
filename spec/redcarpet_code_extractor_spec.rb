require 'spec_helper'
require 'redcarpet_code_extractor'
require 'redcarpet'

RSpec.describe RedcarpetCodeExtractor do
  let(:renderer) do
    Redcarpet::Markdown.new(described_class, fenced_code_blocks: true)
  end

  let(:markdown) do
    md_path = File.join(FIXTURE_PATH, 'redcarpet_code_extractor.md')
    File.read md_path
  end

  it 'splits out a JSON object for blocks, one per line' do
    output = renderer.render(markdown).split("\n").map { |e| JSON.parse e }
    expect(output).to eq [
      { 'code' => "1 + 1\n", 'language' => 'ruby' },
      { 'code' => "2 + 2\n", 'language' => 'javascript' },
    ]
  end
end

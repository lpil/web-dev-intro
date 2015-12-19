require 'redcarpet'
require 'json'

require_relative 'redcarpet_code_extractor'
require_relative 'code_block'


class MarkdownDocument
  attr_reader :source, :identifier

  RENDERER = Redcarpet::Markdown.new(
    RedcarpetCodeExtractor, fenced_code_blocks: true
  )

  def initialize(source:, identifier:)
    @source     = source
    @identifier = identifier
  end

  def code_blocks
    return @code_blocks if instance_variable_defined?(:@code_blocks)
    output_lines = RENDERER.render(source).split("\n")
    output_lines.map.with_index { |e, i| output_line_to_code_block(e, i + 1) }
  end

  private

  def output_line_to_code_block(line, n)
    attrs = JSON.parse(line)
    CodeBlock.new(
      code:       attrs['code'],
      language:   attrs['language'],
      identifier: "Code block #{n} in #{identifier}",
    )
  end
end

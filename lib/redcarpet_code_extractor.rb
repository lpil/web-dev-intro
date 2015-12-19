require 'redcarpet'
require 'json'

class RedcarpetCodeExtractor < Redcarpet::Render::HTML

  NO_OP_METHODS = %i(
    block_quote block_html footnotes footnote_def header hrule list list_item
    paragraph table table_row table_cell autolink codespan double_emphasis
    emphasis image linebreak link raw_html triple_emphasis strikethrough
    superscript underline highlight quote footnote_ref
  )

  NO_OP_METHODS.each do |name|
    define_method(name) do |*_args|
      nil
    end
  end

  def block_code(code, language)
    { code: code, language: language }.to_json << "\n"
  end
end

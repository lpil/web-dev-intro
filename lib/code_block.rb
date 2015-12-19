class CodeBlock
  attr_reader :code, :language

  def initialize(code:, language:)
    @code     = code.freeze
    @language = language.downcase.freeze if language
  end

  def ruby?
    language == 'ruby'
  end

  def valid_syntax?
    fail NotImplementedError unless ruby?
    return @valid_syntax unless @valid_syntax.nil?

    # Prepend code with throw statement to prevent execution
    safe_code = "throw :ok; #{code}"
    catch(:ok) { eval safe_code } # rubocop:disable Eval
    @valid_syntax = true
  rescue SyntaxError
    @valid_syntax = false
  end
end

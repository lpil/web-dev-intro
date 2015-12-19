class CodeBlock
  attr_reader :code, :language, :identifier

  def initialize(code:, language: nil, identifier: nil)
    @code       = code.freeze
    @language   = language ? language.downcase.freeze : language
    @identifier = identifier
  end

  def ruby?
    language == 'ruby'
  end

  def ==(other)
    other.class == self.class &&
      other.identifier == identifier &&
      other.language == language &&
      other.code == code
  end

  def valid_syntax?
    fail NotImplementedError unless ruby?
    return @valid_syntax if instance_variable_defined?(:@valid_syntax)

    # Prepend code with throw statement to prevent execution
    safe_code = "throw :ok; #{code}"
    catch(:ok) { eval safe_code } # rubocop:disable Eval
    @valid_syntax = true
  rescue SyntaxError
    @valid_syntax = false
  end
end

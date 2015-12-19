require 'spec_helper'
require 'code_block'

RSpec.describe CodeBlock do
  describe '#language' do
    it 'reports the given language' do
      block = described_class.new code: '1 + 1', language: 'ruby'
      expect(block.language).to eq 'ruby'
    end

    it 'downcases the name' do
      block = described_class.new code: '1 + 1', language: 'Ruby'
      expect(block.language).to eq 'ruby'
    end

    it 'handles nil' do
      block = described_class.new code: '1 + 1', language: nil
      expect(block.language).to eq nil
    end
  end


  describe '#code' do
    it 'reports the given language' do
      block = described_class.new code: '1 + 1', language: 'ruby'
      expect(block.code).to eq '1 + 1'
    end
  end


  describe '#ruby?' do
    it do
      block = described_class.new code: '1 + 1', language: 'Ruby'
      expect(block.ruby?).to eq true
    end

    it do
      block = described_class.new code: '1 + 1', language: 'Elixir'
      expect(block.ruby?).to eq false
    end
  end


  describe '#valid_syntax?' do
    it 'is not implemented for non-ruby code blocks' do
      block = described_class.new code: '1 + 1', language: 'Elixir'
      expect { block.valid_syntax? }.to raise_error NotImplementedError
    end

    it 'is true for valid ruby syntax' do
      block = described_class.new code: '1 + 1', language: 'ruby'
      expect(block.valid_syntax?).to eq true
    end

    it 'is false for invalid ruby syntax' do
      block = described_class.new code: '<><><><>', language: 'ruby'
      expect(block.valid_syntax?).to eq false
    end

    it 'does not exec the given code' do
      block = described_class.new(
        code: 'fail Exception, "Given code string was run"',
        language: 'ruby',
      )
      block.valid_syntax?
    end
  end
end

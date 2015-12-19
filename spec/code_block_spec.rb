require 'spec_helper'
require 'code_block'

RSpec.describe CodeBlock do

  it 'reports the given code' do
    block = described_class.new code: '1 + 1', language: 'ruby'
    expect(block.code).to eq '1 + 1'
  end


  it 'reports the given identifier' do
    block = described_class.new code: '', language: 'ruby', identifier: 'Hi'
    expect(block.identifier).to eq 'Hi'
  end


  describe '#language' do
    it 'is optional' do
      block = described_class.new code: '1 + 1'
      expect(block.language).to eq nil
    end

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

  describe 'equality' do
    it 'is equal with the same attrs' do
      a = described_class.new code: '1 + 1', language: 'elixir'
      b = described_class.new code: '1 + 1', language: 'Elixir'
      expect(a).to eq b
    end

    it 'is not equal with different code' do
      a = described_class.new code: '1 + 1', language: 'Elixir'
      b = described_class.new code: '2 + 1', language: 'Elixir'
      expect(a).not_to eq b
    end

    it 'is not equal with different language' do
      a = described_class.new code: '1 + 1', language: 'Elixir'
      b = described_class.new code: '1 + 1', language: 'Ruby'
      expect(a).not_to eq b
    end

    it 'is not equal with different identifiers' do
      a = described_class.new code: '', language: 'c', identifier: 'Hi'
      b = described_class.new code: '', language: 'c', identifier: 'Bye'
      expect(a).not_to eq b
    end
  end
end

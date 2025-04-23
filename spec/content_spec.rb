# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Wivlt::Content do
  describe '#initialize' do
    context 'when input is valid' do
      let(:input) { '"this is the description" #tag1 #tag2 !link' }
      subject(:content) { described_class.new(input) }

      it { expect(content.description).to eq 'this is the description' }
      it { expect(content.tags).to eq ['#tag1', '#tag2'] }
      it { expect(content.links).to eq ['!link'] }
    end

    context 'when input is invalid' do
      let(:input) { '"" #tag1 #tag2 !link' }
      subject(:content) { described_class.new(input) }

      it { expect(content.error_message).to eq 'invalid input' }
    end
  end
end

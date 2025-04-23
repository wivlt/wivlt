# frozen_string_literal: true

# spec/content_spec.rb

RSpec.describe Content do
  describe '#initialize' do
    subject(:content) { described_class.new(input) }

    context 'when input is valid' do
      let(:input) { '"this is the description" #tag1 #tag2 !link' }

      it 'parses the description, tags, and links correctly' do
        aggregate_failures do
          expect(content.description).to eq('this is the description')
          expect(content.tags).to eq(['#tag1', '#tag2'])
          expect(content.links).to eq(['!link'])
          expect(content.error_message).to be_nil
        end
      end
    end

    context 'when input is invalid' do
      let(:input) { '"" #tag1 #tag2 !link' }

      it 'sets the error message' do
        expect(content.error_message).to eq('invalid input')
        expect(content.description).to be_nil
        expect(content.tags).to be_nil.or eq([])
        expect(content.links).to be_nil.or eq([])
      end
    end
  end
end

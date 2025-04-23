# frozen_string_literal: true

# spec/validator_spec.rb

RSpec.describe Validator do
  describe '.input_valid?' do
    shared_examples 'a valid command' do
      it 'is valid' do
        expect(Validator.input_valid?(command)).to be_truthy
      end
    end

    shared_examples 'an invalid command' do
      it 'is invalid' do
        expect { Validator.input_valid?(command) }.to raise_error(ArgumentError, 'invalid input')
      end
    end

    context 'when only description is present' do
      let(:command) { '"this is a basic description"' }
      it_behaves_like 'a valid command'
    end

    context 'when description is empty' do
      let(:command) { '"" #tag1 #tag2 !link' }
      it_behaves_like 'an invalid command'
    end

    context 'when description is blank' do
      let(:command) { '" " #tag1 #tag2 !link' }
      it_behaves_like 'an invalid command'
    end

    context 'when description is missing' do
      let(:command) { '#tag1 #tag2 !link' }
      it_behaves_like 'an invalid command'
    end

    context 'when has description and single tag' do
      let(:command) { '"this is a basic description" #tag1' }
      it_behaves_like 'a valid command'
    end

    context 'when has description and single link' do
      let(:command) { '"this is a basic description" !link1' }
      it_behaves_like 'a valid command'
    end

    context 'when has description and multiple links' do
      let(:command) { '"this is a basic description" !link1 !link2 !link3' }
      it_behaves_like 'a valid command'
    end

    context 'when has description, single tag and link' do
      let(:command) { '"this is a basic description" #tag1 !link1' }
      it_behaves_like 'a valid command'
    end

    context 'when has description and multiple tags' do
      let(:command) { '"this is a basic description" #tag1 #tag2 #tag3' }
      it_behaves_like 'a valid command'
    end

    context 'when has description and multiple tags and one link' do
      let(:command) { '"this is a basic description" #tag1 #tag2 #tag3 !link1' }
      it_behaves_like 'a valid command'
    end

    context 'when has description and multiple tags and links' do
      let(:command) { '"this is a basic description" #tag1 #tag2 #tag3 !link1 !link2' }
      it_behaves_like 'a valid command'
    end

    context 'when content after description is not tag nor link' do
      let(:command) { '"this is a basic description" not_a_tag not_a_link' }
      it_behaves_like 'an invalid command'
    end
  end
end

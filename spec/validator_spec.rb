require 'validator'

RSpec.describe 'Validator' do
  describe '.input_valid?' do
    context 'when only description is present' do
      it 'should be valid' do
        command = '"this is a basic description"'
        expect(Validator.input_valid?(command)).to be_truthy
      end
    end

    context 'when description is empty' do
      it 'should be invalid' do
        command = '"" #tag1 #tag2 !link'
        expect(Validator.input_valid?(command)).to be_falsey
      end
    end

    context 'when description is blank' do
      it 'should be invalid' do
        command = '" " #tag1 #tag2 !link'
        expect(Validator.input_valid?(command)).to be_falsey
      end
    end

    context 'when description is nil' do
      it 'should be invalid' do
        command = '#tag1 #tag2 !link'
        expect(Validator.input_valid?(command)).to be_falsey
      end
    end

    context 'when has description and single tag' do
      it 'should be valid' do
        command = '"this is a basic description" #tag1'
        expect(Validator.input_valid?(command)).to be_truthy
      end
    end

    context 'when has description and single link' do
      it 'should be valid' do
        command = '"this is a basic description" !link1'
        expect(Validator.input_valid?(command)).to be_truthy
      end
    end

    context 'when has description and multiple links' do
      it 'should be valid' do
        command = '"this is a basic description" !link1 !link2 !link3'
        expect(Validator.input_valid?(command)).to be_truthy
      end
    end

    context 'when has description, single tag and link' do
      it 'should be valid' do
        command = '"this is a basic description" #tag1 !link1'
        expect(Validator.input_valid?(command)).to be_truthy
      end
    end

    context 'when has description and multiple tags' do
      it 'should be valid' do
        command = '"this is a basic description" #tag1 #tag2 #tag3'
        expect(Validator.input_valid?(command)).to be_truthy
      end
    end

    context 'when has description and multiple tags and one link' do
      it 'should be valid' do
        command = '"this is a basic description" #tag1 #tag2 #tag3 !link1'
        expect(Validator.input_valid?(command)).to be_truthy
      end
    end

    context 'when has description and multiple tags and links' do
      it 'should be valid' do
        command = '"this is a basic description" #tag1 #tag2 #tag3 !link1 !link2'
        expect(Validator.input_valid?(command)).to be_truthy
      end
    end

    context 'when content after description is not tag nor link' do
      it 'should be valid' do
        command = '"this is a basic description" not_a_tag not_a_link'
        expect(Validator.input_valid?(command)).to be_falsey
      end
    end
  end
end

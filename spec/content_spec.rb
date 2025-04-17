require 'content'

RSpec.describe 'Content' do
  describe '#initialize' do
    context 'when input is valid' do
      input = '"this is the description" #tag1 #tag2 !link'
      content = Content.new(input)

      it { expect(content.description).to eq "this is the description" }
      it { expect(content.tags).to eq ["#tag1", "#tag2"] }
      it { expect(content.links).to eq ['!link'] }
    end

    context 'when input is invalid' do
      input = '"" #tag1 #tag2 !link'
      content = Content.new(input)
      it { expect(content.error_message).to eq "invalid input" }
    end
  end
end

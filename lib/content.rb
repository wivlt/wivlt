# frozen_string_literal: true

class Content # rubocop:disable Style/Documentation
  REGEX = /^"(?<description>[^"]+)"(?:\s+(?<rest>.*))?$/
  attr_accessor :description, :tags, :links, :error_message

  def initialize(input)
    begin
      if Validator.input_valid?(input)
        match = REGEX.match(input)
        @description = match[:description]
        rest = match[:rest]

        @tags = rest.scan(/#\S+/)
        @links = rest.scan(/!\S+/)
      end
    rescue StandardError => e
      @error_message = e.message
    end

    @error_message
  end
end

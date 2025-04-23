# frozen_string_literal: true

# lib/wivlt/validator.rb

class Validator # rubocop:disable Style/Documentation
  REGEX = /^"([^\s"][^"]*)"(?:\s+(#\S+))*?(?:\s+(!\S+))*?$/.freeze

  def self.input_valid?(command)
    raise ArgumentError.exception("invalid input") unless REGEX.match(command)

    true
  end
end

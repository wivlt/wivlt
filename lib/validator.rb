# frozen_string_literal: true

class Validator # rubocop:disable Style/Documentation
  REGEX = /^"([^\s"][^"]*)"(?:\s+(#\S+))*?(?:\s+(!\S+))*?$/

  def self.input_valid?(command)
    raise ArgumentError.exception('invalid input') unless REGEX.match(command)

    true
  end
end

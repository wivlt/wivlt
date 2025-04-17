class Validator
  REGEX = /^"([^\s"][^"]*)"(?:\s+(#\S+))*?(?:\s+(!\S+))*?$/

  def self.input_valid?(command)
    raise ArgumentError.exception('invalid input') unless REGEX.match(command)

    true
  end
end

class Validator
  REGEX = /^"([^\s"][^"]*)"(?:\s+(#\S+))*?(?:\s+(!\S+))*?$/

  def self.input_valid?(command)
    REGEX.match(command)
  end
end

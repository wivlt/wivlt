# frozen_string_literal: true

# lib/wivlt.rb

require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir(__dir__.to_s) # Load everything under lib/
loader.enable_reloading
loader.setup

module Wivlt
  # Main module for Wivlt, a command-line tool for managing and organizing tasks.
  # This module serves as the entry point for the application.
  class Error < StandardError; end
end

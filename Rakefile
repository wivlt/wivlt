# frozen_string_literal: true

require 'rspec/core/rake_task'

desc 'Run RSpec tests'
RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Run Add Path Comments Script'
task :add_path_comments do
  script_path = File.expand_path("#{__dir__}/tools/add_path_comments.rb")
  abort("Script not found: #{script_path}") unless File.exist?(script_path)

  puts "Running: #{script_path}"
  success = system(RbConfig.ruby, script_path)

  abort("Script failed: #{script_path}") unless success
  system("ruby #{script_path}")
end

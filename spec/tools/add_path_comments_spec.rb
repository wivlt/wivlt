# frozen_string_literal: true

# spec/tools/add_path_comments_spec.rb

require 'spec_helper'
require 'fileutils'
require 'tmpdir'

RSpec.describe 'add_path_comments script' do
  let(:script_path) { File.expand_path('../../tools/add_path_comments.rb', __dir__) }

  around do |example|
    Dir.mktmpdir do |tmpdir|
      @tmpdir = tmpdir
      @lib_path = File.join(tmpdir, 'lib')
      FileUtils.mkdir_p(@lib_path)
      example.run
    end
  end

  def write_lib_file(path, content)
    full_path = File.join(@lib_path, path)
    FileUtils.mkdir_p(File.dirname(full_path))
    File.write(full_path, content)
    full_path
  end

  def read_lib_file(path)
    File.read(File.join(@lib_path, path))
  end

  def run_script
    system("ruby #{script_path}", chdir: @tmpdir)
  end

  it 'adds path comment below frozen_string_literal if not present' do
    write_lib_file('example.rb', <<~RUBY)
      # frozen_string_literal: true

      class Example; end
    RUBY

    run_script

    content = read_lib_file('example.rb')
    expect(content).to include('# frozen_string_literal: true')
    expect(content).to include('# lib/example.rb')
  end

  it 'adds path comment at the top if frozen_string_literal is missing' do
    write_lib_file('example2.rb', <<~RUBY)
      class Example2; end
    RUBY

    run_script

    content = read_lib_file('example2.rb')
    expect(content.lines.first.strip).to eq('# lib/example2.rb')
  end

  it 'does not duplicate path comment if already present' do
    write_lib_file('already_tagged.rb', <<~RUBY)
      # frozen_string_literal: true

      # lib/already_tagged.rb

      class AlreadyTagged; end
    RUBY

    run_script

    content = read_lib_file('already_tagged.rb')
    expect(content.scan(%r{# lib/already_tagged\.rb}).size).to eq(1)
  end
end

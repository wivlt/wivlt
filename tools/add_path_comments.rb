# frozen_string_literal: true

# tools/add_path_comments.rb

# TODO: Extract me to a gem later
require "pathname"

Dir.glob(["spec/**/*.rb", "lib/**/*.rb"]).each do |file_path|
  lines = File.readlines(file_path)
  relative_path = Pathname.new(file_path).cleanpath.to_s
  path_comment = "# #{relative_path}"

  has_frozen = lines.first&.strip == "# frozen_string_literal: true"
  has_path_comment = lines.any? { |line| line.strip == path_comment }

  next if has_path_comment

  if has_frozen
    # Insert path comment two lines below frozen_string_literal, surrounded by empty lines
    insert_index = 1
    lines.insert(insert_index, "\n") unless lines[insert_index] == "\n"
    lines.insert(insert_index + 1, "#{path_comment}\n", "\n")
  else
    # Insert path comment at the top of the file with an empty line after
    lines.unshift("\n") unless lines.first == "\n"
    lines.unshift("#{path_comment}\n")
  end

  File.write(file_path, lines.join)
end

newBaseurl = ARGV[0]

file_names = ['_config.yml']

# string to match
matched_str = 'baseurl:'

replacement_str = matched_str + ' ' + newBaseurl

file_names.each do |file_name|
  text = File.read(file_name)

  new_content = text.gsub(/(#{matched_str}) .*/, replacement_str)

  # write changes to file
  File.open(file_name, "w") {|file| file.puts new_content }
end

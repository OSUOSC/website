# loops through all posts reverse chronologically in '/_posts'
# until 'meeting_date' is defined in the YAML Front Matter block
# then precedes to write 'meeting_date' to '_config.yml'

require 'time'

posts = Dir['_posts/*']

is_match = false
i = 0

while i < posts.length
  
  # sort posts reverse chronologically
  post = posts.sort.reverse

  File.open(post[i], 'r') do |p|
    
    # read each line in the post
    p.each_line do |line|
      matched_str = 'meeting_date:'

      next unless line.include? matched_str
      
      date = line.split(' ').last # expects YYYY-MM-DD
      humanized_date = Date.parse(date).strftime('%B %d, %Y')

      replacement_str = matched_str + ' ' + humanized_date

      path = '_config.yml'
      content = File.read(path).gsub(/(#{matched_str}) .*/, replacement_str)

      # write changes to file
      File.open(path, 'w') { |f| f.puts content }
      is_match = true
    end
  end

  i += 1
  break if is_match == true

end

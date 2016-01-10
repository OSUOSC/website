require 'time'

posts = Dir['_posts/*']

is_match = false
i = 0

while i < posts.length
  post = posts.sort.reverse

  File.open(post[i], 'r') do |f|
    f.each_line do |line|

      if line.include? 'meeting_date:'
        t = line.split(' ').last # expects YYYY-MM-DD

        # TODO
        # check if the correct time format is used else throw error

        date = Date.parse(t).strftime('%B %d, %Y') # humanize time

        file_names = ['_config.yml']

        # string to match
        matched_str = 'next_meeting_date:'

        replacement_str = matched_str + ' ' + date

        file_names.each do |file_name|
          text = File.read(file_name)

          new_content = text.gsub(/(#{matched_str}) .*/, replacement_str)

          # write changes to file
          File.open(file_name, "w") {|file| file.puts new_content }
        end

        is_match = true
      end

    end
  end

  i += 1
  break if is_match == true
end

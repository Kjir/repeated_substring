class RepeatedSubstring
  def find_repeated_substring(string)
    longest_word = 'NONE'
    longest = string.length / 2
    while longest_word == 'NONE' && longest > 1 do
      (string.length - longest + 1).times do |n|
        current_word = string[n..(longest + n - 1)]
        unless string[longest + n, string.length].index(current_word).nil?
          longest_word = current_word
          break
        end
      end
      longest -= 1
    end
    longest_word.strip
  end

  def find_repeated_substring_file(file_path)
    File.open(file_path).read.each_line.map { |line| find_repeated_substring(line) }
  end
end

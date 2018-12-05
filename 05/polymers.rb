data = File.read(ARGV[0]).strip

def reduce str
  loop do
    len = str.length

    ('a'..'z').each do |c|
      str.gsub!("#{c}#{c.upcase}", "")
      str.gsub!("#{c.upcase}#{c}", "")
    end

    return len if str.length == len
  end
end

puts "Star 1: #{reduce(data.dup)}"

len_map = ('a'..'z').map { |remove|
  d = data.dup
  d.gsub!(/[#{remove}#{remove.upcase}]/, '')

  reduce d
}


puts "Star 2: #{len_map.min}"

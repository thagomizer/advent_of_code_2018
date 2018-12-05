numbers = File.read(ARGV[0]).gsub("+", "").split("\n").map(&:to_i)

puts "Day 1, Star 1 #{numbers.inject(:+)}"

sums = Hash.new(false)

total = 0

loop do
  numbers.each do |n|
    if sums[total]
      puts "Day 1, Star 2 #{total}"
      exit
    else
      sums[total] = true
      total += n
    end
  end
end

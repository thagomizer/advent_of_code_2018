data = File.read(ARGV[0]).split("\n").sort

guards = Hash.new { |h, k| h[k] = Hash.new(0) }

guard  = nil
start  = nil

data.each do |line|
  if line =~ /\[.*:(\d\d)\] Guard #(\d+)/
    guard = $2.to_i
  elsif line =~ /\[.*:(\d\d)\] falls asleep/
    start = $1.to_i
  elsif line =~ /\[.*:(\d\d)\] wakes up/
    (start...$1.to_i).each do |i|
      guards[guard][i] += 1
    end
  end
end

sleeps_most = guards.max_by { |id, data| data.values.inject(:+) }.first

min_asleep = guards[sleeps_most].max_by { |min, days| days }.first

puts "Star 1: #{sleeps_most * min_asleep}"

star2 = [nil, 0, 0]

guards.each do |guard, sleep_data|
  guard_max = sleep_data.max_by{ |min, count| count}
  if guard_max[1] > star2[2] then
    star2 = [guard, *guard_max]
  end
end

puts "Star 2: #{star2[0] * star2[1]}"

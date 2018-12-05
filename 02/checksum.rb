require 'pp'

raw_data = File.read(ARGV[0]).split("\n")
data     = raw_data.map { |l| l.split('').group_by { |x| x } }

groups_of_two   = data.map { |d| d.any? { |_, v| v.length == 2 }}.count(true)

groups_of_three = data.map { |d| d.any? { |_, v| v.length == 3 }}.count(true)

puts "Star 1: #{groups_of_two * groups_of_three}"

def hamming_distance str1, str2
  count = 0

  0.upto(str1.length) do |n|
    count += 1 if str1[n] != str2[n]
  end

  count
end

raw_data.each do |d1|
  raw_data.each do |d2|
    next if d2 == d1

    if hamming_distance(d1, d2) == 1
      print "Star 2: "

      0.upto(d1.length) do |n|
        print d1[n] if d1[n] == d2[n]
      end

      print "\n"
      exit
    end
  end
end

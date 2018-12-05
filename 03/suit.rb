raw_data = File.read(ARGV[0]).split(/[@:\n]/).map(&:strip)

fabric = Hash.new(0)

raw_data.each_slice(3) do |_, upper_left, size|
  l, t = upper_left.split(",").map(&:to_i)
  w, h = size.split("x").map(&:to_i)

  (l...(l + w)).each do |x|
    (t...(t + h)).each do |y|
      fabric["#{x},#{y}"] += 1
    end
  end
end

puts "Star 1: #{fabric.select { |h, k| k > 1}.count}"

raw_data.each_slice(3) do |id, upper_left, size|
  l, t = upper_left.split(",").map(&:to_i)
  w, h = size.split("x").map(&:to_i)

  overlap = false

  (l...(l + w)).each do |x|
    (t...(t + h)).each do |y|
      if fabric["#{x},#{y}"] > 1 then
        overlap = true
        break
      end
    end
    break if overlap
  end

  unless overlap
    puts "Star 2: #{id}"
    exit
  end
end

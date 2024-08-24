file = File.open('foo.txt')
puts file.readlines.map(&:chop)
file.close

puts

File.foreach('foo.txt') { |line| puts line }

file = File.open('foo.txt', 'a')
file.write('foobar')
file.close

File.open('foo.txt', 'a') { |f| f.write('barbaz') }

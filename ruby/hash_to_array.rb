hash = { 'a' => 'b', 'b' => 'c' }
hash.to_a.each { |a| puts "#{a}" }

list = [%w[a b], %w[b c]]
puts list.to_h

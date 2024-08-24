# 1.)
list = []
(1..16).each { |i| list.push(i) }

len = list.length
sliced_list = []
(0...((len / 4).floor)).each do |i|
  sliced_list.append(list.slice(i * 4, 4))
end

puts "#{sliced_list}"

list.each_slice(4) { |a| puts "#{a}" }

# 2
class Tree
  attr_accessor :children, :node_name

  def initialize(hash = {})
    @node_name = hash.keys[0]
    @children = []
    hash[@node_name].each { |a| @children.append(Tree.new([a].to_h)) } if hash[@node_name].is_a?(Hash)
    return unless hash[@node_name].is_a?(String)

    @children.append(Tree.new({ hash[@node_name] => nil }))
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block) }
  end

  def visit(&block)
    block.call self
  end
end

tree = Tree.new({ 'g' => { 'd' => 'c', 'a' => 'b' } })
tree.visit_all { |t| puts t.node_name }

# 3.)
File.foreach('foo.txt') do |line|
  puts line if /foo/.match?(line)
end

require_relative './enumerable'

class MyList
  include MyEnumerable

  # Instance initialization
  def initialize(*list)
    @list = list
  end

  # yield each element in the list
  def each
    return to_enum unless block_given?

    (0..(@list.length - 1)).each do |i|
      yield @list[i]
    end
  end
end

# Create our list
list = MyList.new(1, 2, 3, 4)

# Test #all?
p(list.all? { |e| e < 5 })
# => true
p(list.all? { |e| e > 5 })
# => false

# Test #any?
p(list.any? { |e| e == 2 })
# => true
p(list.any? { |e| e == 5 })
# => false

# Test #filter
p list.filter(&:even?)
# => [2, 4]

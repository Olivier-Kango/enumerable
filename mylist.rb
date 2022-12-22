equire_relative './enumerable'

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


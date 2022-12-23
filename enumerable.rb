module MyEnumerable
  def all?
    case block_given?
    when false
      each { |i| return false if i.nil? }
    when true
      each { |i| return false unless yield i }
    end
    true
  end

  def any?
    case block_given?
    when false
      each { |i| return true unless i.nil? }
    when true
      each { |n| return true if yield n }
    end
    false
  end

  def filter
    case block_given?
    when false
      to_enum
    when true
      filter_arr = []
      each { |n| filter_arr.push(n) if yield n }
      filter_arr
    end
  end
end
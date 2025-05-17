class HashMap
  DEFAULT_CAPACITY = 8
  LOAD_FACTOR = 0.75

  def initialize
    @capacity = DEFAULT_CAPACITY
    @map = Array.new(@capacity)
    @count = 0
  end

  def set(key, value)
    resize! if (@count + 1).to_f / @capacity > LOAD_FACTOR

    index = hash(key)
    @map[index] ||= []
    pair = @map[index].find { |p| p[0] == key }
    if pair
      pair[1] = value
    else
      @map[index].push([key, value])
      @count += 1
    end
  end

  def get(key)
    index = hash(key)
    return nil unless @map[index]
    @map[index].each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def remove(key)
    index = hash(key)
    return nil unless @map[index]
    before = @map[index].size
    @map[index].delete_if { |pair| pair[0] == key }
    @count -= 1 if @map[index].size < before
  end
  alias_method :delete, :remove

  def has?(key)
    index = hash(key)
    return false unless @map[index]
    @map[index].any? { |pair| pair[0] == key }
  end

  def length
    @count
  end

  def capacity
    @capacity
  end

  def clear
    @map = Array.new(@capacity)
    @count = 0
  end

  def keys
    @map.compact.flat_map { |bucket| bucket.map { |pair| pair[0] } }
  end

  def values
    @map.compact.flat_map { |bucket| bucket.map { |pair| pair[1] } }
  end

  def entries
    @map.compact.flat_map { |bucket| bucket.map { |pair| pair.dup } }
  end

  private

  def hash(key)
    key.hash % @capacity
  end

  def resize!
    old_map = @map
    @capacity *= 2
    @map = Array.new(@capacity)
    @count = 0
    old_map.compact.each do |bucket|
      bucket.each { |k, v| set(k, v) }
    end
  end
end
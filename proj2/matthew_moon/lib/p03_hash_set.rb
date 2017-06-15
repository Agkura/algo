require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if count == num_buckets
      resize!
      insert(key)
    else
      unless include?(key)
        @count += 1
        self[key.hash].push(key)
      end
    end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    @count -= 1
    self[key.hash].delete(key)
  end

  private

  def [](num)
    @store[ num % num_buckets ]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_trough = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |key|
        new_trough[key.hash % new_trough.length].push(key)
      end
    end
    @store = new_trough
  end
end

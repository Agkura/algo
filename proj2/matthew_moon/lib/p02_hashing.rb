class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hashy = ""
    self.each_with_index { |el, idx| hashy += (el.to_s.ord + idx).to_s}
    hashy.to_i.hash
  end
end

class String
  def hash
    hashy = []
    self.chars.each_with_index { | el, idx | hashy << el.ord + idx }
    hashy.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    num = 0
    self.each do |key, el|
      num += key.to_s.ord + el.ord
    end
    num.hash
  end
end

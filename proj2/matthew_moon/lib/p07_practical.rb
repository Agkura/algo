require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  mapped = HashMap.new
  over = 0
  string.chars.each do |char|
    val = mapped.get(char)
    if val.nil?
      val = 1
    else
      val += 1
    end
    mapped.set(char, val)
  end
  mapped.each {|key, val| over += 1 if val % 2 != 0 }
  return true unless over > 1
  false
end

# O(2n) => O(n)

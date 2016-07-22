### Given a string, convert the string to numbers (a -> 0, b -> 1, etc)
### Return all possible combinations of string that can be made from the same
### rule.
### I.E. "abcd" => "0123" => ["abcd", "amd", "abx"]

## this solution requires O(2^n) space and time complexity because
## the question scales exponentially with string length
## optimizations can be made with memoization, but exponential time
## will remain
require('set')

def alphabet_matcher(str)
  mapping = ('0'..'25').to_a.zip(("a".."z").to_a).to_h
  string_to_num = ("a".."z").to_a.zip(('0'..'25').to_a).to_h
  nums = ""
  str.each_char { |char| nums += string_to_num[char] }
  alphabet_matcher_helper(mapping, nums).to_a ## to pass the specs
end

def alphabet_matcher_helper(map, nums)
  string_to_num = ("a".."z").to_a.zip(('0'..'25').to_a).to_h
  matches = map.select{|k,v| nums.start_with?(k)}.values

  return [""].to_set if matches.empty?

  suffix = Set.new
  matches.each do |match|

    new_nums = nums[string_to_num[match].length..-1]
    a = alphabet_matcher_helper(map, new_nums).map do |remainder|
      match + remainder
    end.to_set
    suffix = suffix | a
  end
  suffix
end

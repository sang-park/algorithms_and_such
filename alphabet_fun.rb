require('set')


def alphabet_matches(str)
  string_to_num = ("a".."z").to_a.zip(('0'..'25').to_a).to_h
  num_to_string = ('0'..'25').to_a.zip(("a".."z").to_a).to_h

  nums = ""
  str.each_char { |char| nums += string_to_num[char].to_s}
  suffix = Hash.new {|h,k| h[k] = [] }


  num_recur(nums, suffix)


end

def num_recur(nums,suffix)
  return num_to_string[nums] if nums.length == 1
  return suffix[nums] if suffix[nums]

  matches = num_to_string.select {|k,v| nums.start_with?(v)}.values

  matches.each do |match|
    new_nums = nums[match.length..-1]
    endings = num_recur(new_nums,suffix).map do |remainder|
      match + remainder
    end
    suffix[]
  end

end

###### Ben Calabrese's solution

def weirdo(map, nums)
  string_to_num = ("a".."z").to_a.zip(('0'..'25').to_a).to_h
  num_to_string = ('0'..'25').to_a.zip(("a".."z").to_a).to_h
  matches = map.select{|k,v| nums.start_with?(k)}.values

  matches = [""] if matches.empty?
  return matches.to_set if nums.length < 2


  suffix = Set.new
  matches.each do |match|
    new_nums = nums[string_to_num[match].length..-1]
    a = weirdo(map, new_nums).map do |remainder|
      match + remainder
    end.to_set
    suffix = suffix | a
  end
  suffix
end


a = weirdo(('0'..'25').to_a.zip(("a".."z").to_a).to_h,"22")

def nor(a,b)
  !(a || b)
end

def exclusive(a,b)
  nor(nor(nor(a,b),a), nor(nor(a,b),b))
end

def mutual(a,b)
  nor(exclusive(a,b), exclusive(a,b))
end

puts mutual(true, true)
puts mutual(true, false)
puts mutual(false, true)
puts mutual(false, false)

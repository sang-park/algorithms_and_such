def stair_paths(n, m = {})
  return 1 if n == 0
  return 0 if n < 0

  return m[n] if m[n]
  puts ("not memoized: " + n.to_s)
  m[n] =  stair_paths(n-1,m) +
          stair_paths(n-2,m) +
          stair_paths(n-3,m)
end

# puts stair_paths(10)

def stair(n)
  m = {}
  helper(n-1,m) + helper(n-2,m) + helper(n-3,m)
end

def helper(n, m)
  return 1 if n == 0
  return 0 if n < 0
  return m[n] if m[n]
  puts ("not memoized: " + n.to_s)
  m[n] =  helper(n-1,m) +
          helper(n-2,m) +
          helper(n-3,m)
end

puts stair(10)

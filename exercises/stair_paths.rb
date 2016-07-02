# given a staircase of length n, and you can take 1, 2 or 3
# steps at a time, how many different ways can you
# climb the stairs?


# recursion with memoization and no helper method
# O(n) time O(n) space

def stair_paths(n, m = {})
  return 1 if n == 0
  return 0 if n < 0
  return m[n] if m[n]

  m[n] =  stair_paths(n-1,m) +
          stair_paths(n-2,m) +
          stair_paths(n-3,m)
end


# with helper function
def stair_paths(n)
  m = {}
  helper(n-1,m) + helper(n-2,m) + helper(n-3,m)
end

def helper(n, m)
  return 1 if n == 0
  return 0 if n < 0
  return m[n] if m[n]
  m[n] =  helper(n-1,m) +
          helper(n-2,m) +
          helper(n-3,m)
end

### A NOR operator (AKA 'not or') returns true if both of its inputs
### are false. In all other cases it returns false. Imagine a
### programming language that has only the NOR operator.

### For ease of programming you can treat the NOR operator
### like the following function:
def nor(a,b)
  !(a || b)
end

###Given these constraints, write methods that are equivalent to:

def exclusive_disjunction(a,b)
  # (p || q) && !(p && q)
end

def material_equivalence(a,b)
  # (p && q) || !(p || q)
end


### my solutions
def exclusive_disjunction(a,b)
  nor(nor(nor(a,b),a), nor(nor(a,b),b))
end

def material_equivalence(a,b)
  nor(exclusive(a,b), exclusive(a,b))
end


### solutions from pairboarding, with helper functions
def my_not(p)
  nor(p, p)
end

def my_or(p, q)
  nor(nor(p, q), nor(p, q))
end

def my_and(p, q)
  nor(nor(p, p), nor(q, q))
end

# use these to solve the actual problems
def my_material_equivalence(p, q)
  my_and(my_and(p, q), my_not(my_or(p, q)))
end

def my_exclusive_disjunction(p, q)
  my_and(my_or(p, q), my_not(my_and(p, q)))
end

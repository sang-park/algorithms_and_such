### A NOR operator (AKA 'not or') returns true if both of its inputs
### are false. In all other cases it returns false. Imagine a
### programming language that has only the NOR operator.

### For ease of programming you can treat the NOR operator
### like the following function:

def nor(a,b)
  !(a || b)
end

###Given these constraints, write methods that are equivalent to:

def material_equivalence(p, q)
  # (p && q) || !(p || q)
end

def exclusive_disjunction(p, q)
  # (p || q) && !(p && q)
end

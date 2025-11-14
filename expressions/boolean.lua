-- TODO: we'd like to implement actual boolean expressions
-- but for now we just have a helper method to resolve the existing comparison operators
COMPARISON_OPERATORS = {
   "=",
   "≠",
   "<",
   "≤",
   ">",
   "≥",
}

function Common:compare(comparison, lhs, rhs)
   if comparison == "=" and lhs == rhs then
      return true
   end
   if comparison == "≠" and lhs ~= rhs then
      return true
   end
   if comparison == "≤" and lhs <= rhs then
      return true
   end
   if comparison == "≥" and lhs >= rhs then
      return true
   end
   if comparison == "<" and lhs < rhs then
      return true
   end
   if comparison == ">" and lhs > rhs then
      return true
   end
   return false
end

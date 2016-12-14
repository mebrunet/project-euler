#=
Problem 4
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.
=#

function isPal(x)
  s = string(x)
  l = length(s)
  for i=1:l
    if (s[i] != s[l-i+1])
      return false
    end
  end
  return true
end

maxPal = 0
p = 0
for i=1:999, j=1:999
  p = i*j
  if (isPal(p) && p > maxPal)
    maxPal = p
  end
end

println("The largest palindrome is: $(maxPal)")

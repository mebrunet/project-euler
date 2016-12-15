#=
Problem 4
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=#

import Primes.factor

function mergeLargest(a::Dict{Int64, Int64}, b::Dict{Int64, Int64})
  for k = keys(b)
    b_k = b[k]
    a_v = get!(a, k, b_k) # Get value or store
    if (a_v < b_k)
      a[k] = b_k
    end
  end
end

p = Dict{Int64, Int64}()
for i = 1:20
  f = factor(i)
  mergeLargest(p, f)
end

@show p

smallest = 1
for k = keys(p)
  smallest *= k ^ p[k]
  println("key $(k), val $(p[k])")
end

# check
for i = 1:20
  if ( smallest % i > 0)
    println("Ooops - not divisible by $(i)")
  end
end

println("The smallest divisible number is: $(smallest)")

#=
Problem 3
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
=#

import Primes.factor

target = 600851475143
factors = collect(keys(factor(target)))

maxFact = maximum(factors)

println("The greatest prime factor is: $(maxFact)")

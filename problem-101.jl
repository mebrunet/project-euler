#=
Problem 101
=#

function u_gen(k::Array, n)
    sum = 0
    for i = length(k):-1:1
        sum = k[i] + sum * n
    end
    return sum
end

N = 11

# first 11 terms
u_n = Vector{Float64}(N)
for i=1:N
    u_n[i] = u_gen([1 -1 1 -1 1 -1 1 -1 1 -1 1], i)
end

# Matrix of coefficients
A = Array{Float64}(N,N)
for i=1:N, j=1:N
    A[i,j] = i^(j-1)
end

sum = 0
for i=1:N-1
    coeff = Array{Int64}(round(inv(A[1:i, 1:i]) * u_n[1:i]))
    FIT = u_gen(coeff, i+1)
    @show coeff
    @show FIT
    sum += FIT
end

println("Sum of FITs is $(sum)")

# Alternatively u_n = A*[1 -1 1 -1 1 -1 1 -1 1 -1 1]'

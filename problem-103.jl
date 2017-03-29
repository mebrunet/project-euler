using Iterators

function sumSubset(set::Array{Int64,1}, subsetNumber::Int64)
    result = 0
    count = 0
    for i = 0:length(set)-1
        if ((2^i & subsetNumber) > 0)
            count += 1
            result += set[i+1]
        end
    end
    return (result, count)
end

function checkSubsets(set::Array{Int64,1})
    num_subsets = 2^length(set)-1
    for i = 1:num_subsets
        for j = 1:num_subsets
            if (i & j == 0) # treating i,j as bit flags, this is the condition for disjoint
                (sum_i, count_i) = sumSubset(set, i)
                (sum_j, count_j) = sumSubset(set, j)
                #println("i: $count_i, $sum_i; j: $count_j, $sum_j")
                if (sum_i == sum_j)
                    return false
                end
                if (count_i > count_j && sum_i <= sum_j)
                    return false
                end
                if (count_i < count_j && sum_i >= sum_j)
                    return false
                end
            end
        end
    end
    return true
end

# Main
best = nothing
best_sum = Inf

for i in subsets(13:48, 7) # Using rough heuristics -- this takes ~2min to run
    if (checkSubsets(i) && sum(i) < best_sum)
        println("Found one!")
        best_sum = sum(i)
        best = i
    end
end

@show join(best)

#=
Note this is relatively "brute-force". There's a more elegant way to do this which could "learn"
from past failures. e.g. once you know 10 & 15 add to 25, no set with these three numbers should be
considered.
=# 

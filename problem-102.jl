#= 
Problem 102
Three distinct points are plotted at random on a Cartesian plane, for which -1000 ≤ x, y ≤ 1000, such that a triangle is formed.

Consider the following two triangles:

A(-340,495), B(-153,-910), C(835,-947)
X(-175,41), Y(-421,-714), Z(574,-645)

It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.

Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file containing the co-ordinates of one thousand "random" triangles, find the number of triangles for which the interior contains the origin.

NOTE: The first two examples in the file represent the triangles in the example given above.
=#

using DataFrames

function containsOrigin(p1, p2, p3)
    # Change of basis approach...
    # Shift origin to p1, then write original origin as a linear combination. Problem gets very easy
    lin_comb = inv([(p2 - p1) (p3 - p1)]) * (-p1)
    if (lin_comb[1] > 0 && lin_comb[2] > 0 && (lin_comb[1] + lin_comb[2] < 1))
        return 1
    end
    return 0
end
    
df = readtable("appendices/p102_triangles.txt", header = false)
numTriangles = size(df)[1]

result = zeros(numTriangles)

for i = 1:numTriangles
    result[i] = containsOrigin(Array(df[i, 1:2])', Array(df[i, 3:4])', Array(df[i, 5:6])')
end

@show sum(result)

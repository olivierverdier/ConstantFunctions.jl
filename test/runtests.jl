using ConstantFunctions
using Test

@testset "Constant Function" begin
    value = 2.0
    f = ConstantFunction(value)
    @test f(0) == value
    @test (2*f)(0) == 2*value
end

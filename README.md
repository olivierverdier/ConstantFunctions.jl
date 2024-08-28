# ConstantFunctions

[![Build Status](https://github.com/olivierverdier/ConstantFunctions.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/olivierverdier/ConstantFunctions.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![codecov](https://codecov.io/gh/olivierverdier/ConstantFunctions.jl/graph/badge.svg?token=DMvNIPam3i)](https://codecov.io/gh/olivierverdier/ConstantFunctions.jl)

## Usage

`ConstantFunction(v)` models a constant function always returning the value `v`.

The functions value can be accessed by providing either zero
or one (arbitrary) argument:

```julia
f = ConstantFunction(10)

f(3) # 10
f() # 10
```

It can also be multiplied:
```julia
f = ConstantFunction(10)
g = 3*f

g isa ConstantFunction # true
g() # 30
```

## Motivation

This is useful if you use a type with functions, with a special treatment for constant functions.
Here is an example.
```julia
struct DifferentialEquation{TF<:Function}
    λ::TF
end

function solve(eq::DifferentialEquation, x0)
    # solve x' = λ(x) x
    # with initial condition x(0) = x0
end

# special case of constant functions
solve(eq::DifferentialEquation{<:ConstantFunction}, x0) = return exp(eq.λ())*x0
```

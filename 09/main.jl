using LinearAlgebra
using Polynomials

v(x) = [1 x[1] ;
        1 x[2] ;
        1 x[3] ;
        1 x[4] ;
        1 x[5] ]

function a(x, y)
  V = v(x)
  Vt = transpose(V)
  a = inv(Vt*V)*(Vt*y)
  return a
end

# Exemplo
x = [0.01 ; 1.02 ; 2.04 ; 2.95 ; 3.55]
y = [1.99 ; 4.55 ; 7.20 ; 9.51 ; 10.82]

r = a(x, y)
println("Exemplo:")
println(r)

# Exercício 7.1.2

z(x) = [1 x[1] ;
        1 x[2] ;
        1 x[3] ;
        1 x[4] ]

function b(x, y)
  V = z(x)
  Vt = transpose(V)
  a = inv(Vt*V)*(Vt*y)
  return a
end

x = [-0.35 ; 0.15 ; 0.23 ; 0.35]
y = [0.2 ; -0.5 ; 0.54 ; 0.7]

r = b(x, y)
polynomial_b = Polynomial(r)
println("\nExercício 7.1.2:")
println("f(x) = ", polynomial_b)
print("\n")

# Exercício 7.2.3

x = [0.0 ; 0.1 ; 0.2 ; 0.3 ; 0.4 ; 0.5 ; 0.6 ; 0.7 ; 0.8 ; 0.9 ; 1.0]
y = [31 ; 35 ; 37 ; 33 ; 28 ; 20 ; 16 ; 15 ; 18 ; 23 ; 31]

function matriz_sincos(x)
    return [ones(length(x)) sin.(2π*x) cos.(2π*x)]
end

function sincos(x, y)
    V = matriz_sincos(x)
    a_b_c = V \ y
    return a_b_c
end

function matriz_poly(x)
    return [ones(length(x)) x x.^2 x.^3]
end

function poly(x, y)
    V = matriz_poly(x)
    a_b_c_d = V \ y
    return a_b_c_d
end

coeffs_sincos = sincos(x, y)
println("\nExercício 7.2.3:")
println("a) Coeficientes: ", coeffs_sincos)
print("\n")
coeffs_poly = poly(x, y)
println("b) Coeficientes: ", coeffs_poly)
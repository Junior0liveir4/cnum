using LinearAlgebra
using Polynomials
using Plots

P(x) = [1 x[1] x[1]^2 x[1]^3 ;
    1 x[2] x[2]^2 x[2]^3 ;
    1 x[3] x[3]^2 x[3]^3 ;
    1 x[4] x[4]^2 x[4]^3 ]

p(x, y) = P(x) \ y

# Exemplo
x = [0; 1; 2; 3]
y = [1; 6; 5; -8]

a = p(x, y)

f(x) = a[1] + a[2]*x + a[3]*x^2 + a[4]*x^3
r = f(0)

# Exercício 6.1.1
q(x, y) = P(x) \ y

x = [-2; 0; 1; 2]
y = [-47; -3; 4; 41]

b = q(x, y)

polynomial_b = Polynomial(b)
print("Exercício 6.1.1\n")
println("y = ", polynomial_b)
print("\n")

# Exercício 6.1.2
s(x, y) = P(x) \ y
x = [-1; 0.5; 1; 1.25]
y = [1.25; 0.5; 1.25; 1.8125]

c = s(x, y)
polynomial_c = Polynomial(c)
print("Exercício 6.1.2\n")
println("y = ", polynomial_c)
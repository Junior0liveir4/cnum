using .MathConstants:e

#Exercício 3.2.1

function bissection(a, b, f, tol)
  x = (a+b)/2
  while abs(f(x)) > tol
    if f(a)*f(x) > 0
      a = x
    else
    b = x
    end
    x = (a+b)/2
  end
  return x
end

f(x) = sqrt(x) - cos(x)
tol = 10^-4
r = bissection(0, 1, f, tol)
println(r)

#Exercício 3.2.2

f(x) = 5*sin(x^2) - exp(x/10)
tol = 10^-5
r = bissection(0.4, 0.5, f, tol)
println(r)

r = bissection(1.7, 1.8, f, tol)
println(r)

r = bissection(2.5, 2.6, f, tol)
println(r)

#Exercício 3.2.8
t = 300
q = 1.6*10^-19
k = 1.38*10^-23
ir = 10^-12

vt = k.t/q
v = 30
r = 1
f(x) = ir*(exp(vd/vt) - 1) - v/r - vd
tol = 10^-3
r = bissection(0, 1, f, tol)
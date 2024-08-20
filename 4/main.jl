#Exercício 3.3.1
function fixedpoint(a, g, error)
  x = g(a)
  while abs(x-a) > error
    a = x
    x = g(a)
  end
  return x
end

g(x) = exp(x) - 2
error = 10^-8
r = fixedpoint(-1.8, g, error)
println(r)

#Exercício 3.4.1
function newtonmethod(a, f, df, error)
  x = a
  while abs(f(x)) > error
    x = x - f(x)/df(x)
  end
  return x
end

f(x) = cos(x) - x^2
df(x) = -sin(x) - 2*x
a = 1
error = 10^-5
r = newtonmethod(a, f, df, error)
println(r)

#Exercício 3.6.3
function secant(a, b, f, error)
  g(a, b) = (a*f(b) - b*f(a))/(f(b) - f(a))
  x = g(a, b)
  while abs(x-b) > error
    a = b
    b = x
    x = g(a, b)
  end
  return x
end

f(x) = exp(-x^2) - 2*x
a = 0.5
b = 1
error = 10^-5
r = secant(a, b, f, error)
println(r)

#Exercício 3.6.4
I_r = 10^-12
V_t = ((1.38*10^-23)*(300))/(1.60*10^-19)
tol = exp(-3)

R = 10^3
V = 30
f_newton(x) = R*(I_r*(exp(x/V_t) - 1)) + x - V
df_newton(x) = R*(I_r/V_t)*(exp(x/V_t)) + 1
x0 = 0.5

x_newton = newtonmethod(x0, f_newton, df_newton, tol)
x_secant = secant(x0, x_newton, f_newton, tol)
println("Newton Method = ", x_newton)
println("Secant Method = ", x_secant)
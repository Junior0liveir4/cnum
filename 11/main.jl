using .MathConstants:e

function im(f, a, b)
  h = b - a
  return h*(f((a+b)/2))
end

function it(f, a, b)
  h = b - a
  return h*(((1/2)*f(a))+((1/2)*f(b)))
end

function in(f, a, b)
  h = (b - a) / 2
  return h*(((1/3)*f(a))+((4/3)*f((a+b)/2))+((1/3)*f(b)))
end

function iw(f, i, a, b, t)
  s = 0
  c = a
  d = a + t
  while d <= b
    s += i(f, c, d)
    c = d
    d += t
  end
  return s
end

# Exemplo 9.2.4
f(x) = e^(-(x^2))

r = iw(f, im, 0, 1, 0.5)
println(r)

r = iw(f, it, 0, 1, 0.5)
println(r)

r = iw(f, in, 0, 1, 0.5)
println(r)

# Exercício 9.2.1
# Exercício 9.2.3
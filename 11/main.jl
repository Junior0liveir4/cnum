using SpecialFunctions
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
println("Exemplo 9.2.4")
println(r)

r = iw(f, it, 0, 1, 0.5)
println(r)

r = iw(f, in, 0, 1, 0.5)
println(r)
println("\n")

# Exercício 9.2.1:
# Função para calcular o erro absoluto
function erro_absoluto(aprox, analitico)
  return abs(aprox - analitico)
end

f(x) = e^-x
a = iw(f, im, 0, 1, 0.5)
b = iw(f, it, 0, 1, 0.5)
c = iw(f, in, 0, 1, 0.5)
valor_analitico_a = 1 - e^(-1)
erro_im = erro_absoluto(a, valor_analitico_a)
erro_it = erro_absoluto(b, valor_analitico_a)
erro_in = erro_absoluto(c, valor_analitico_a)

println("Exercício 9.2.1:\na)f(x) = e^-x\nPonto Médio: ", a, " Erro: ", erro_im, "\nTrapézio: ", b, " Erro: ", erro_it, "\nSimpson: ", c, " Erro: ", erro_in)

f(x) = x^2
a = iw(f, im, 0, 1, 0.5)
b = iw(f, it, 0, 1, 0.5)
c = iw(f, in, 0, 1, 0.5)
valor_analitico_b = 1 / 3
erro_im = erro_absoluto(a, valor_analitico_a)
erro_it = erro_absoluto(b, valor_analitico_a)
erro_in = erro_absoluto(c, valor_analitico_a)

println("\nb)f(x) = x^2\nPonto Médio: ", a, " Erro: ", erro_im, "\nTrapézio: ", b, " Erro: ", erro_it, "\nSimpson: ", c, " Erro: ", erro_in)

f(x) = x^3
a = iw(f, im, 0, 1, 0.5)
b = iw(f, it, 0, 1, 0.5)
c = iw(f, in, 0, 1, 0.5)
valor_analitico_c = 1 / 4
erro_im = erro_absoluto(a, valor_analitico_a)
erro_it = erro_absoluto(b, valor_analitico_a)
erro_in = erro_absoluto(c, valor_analitico_a)

println("\nc)f(x) = x^3\nPonto Médio: ", a, " Erro: ", erro_im, "\nTrapézio: ", b, " Erro: ", erro_it, "\nSimpson: ", c, " Erro: ", erro_in)

f(x) = x*e^(-(x^2))
a = iw(f, im, 0, 1, 0.5)
b = iw(f, it, 0, 1, 0.5)
c = iw(f, in, 0, 1, 0.5)
valor_analitico_d = 0.5 * (1 - e^(-1))
erro_im = erro_absoluto(a, valor_analitico_a)
erro_it = erro_absoluto(b, valor_analitico_a)
erro_in = erro_absoluto(c, valor_analitico_a)

println("\nd)f(x) = x*e^(-(x^2))\nPonto Médio: ", a, " Erro: ", erro_im, "\nTrapézio: ", b, " Erro: ", erro_it, "\nSimpson: ", c, " Erro: ", erro_in)

f(x) = 1/(x^2+1)
a = iw(f, im, 0, 1, 0.5)
b = iw(f, it, 0, 1, 0.5)
c = iw(f, in, 0, 1, 0.5)
valor_analitico_e = π / 4
erro_im = erro_absoluto(a, valor_analitico_a)
erro_it = erro_absoluto(b, valor_analitico_a)
erro_in = erro_absoluto(c, valor_analitico_a)

println("\ne)f(x) = 1/(x^2+1)\nPonto Médio: ", a, " Erro: ", erro_im, "\nTrapézio: ", b, " Erro: ", erro_it, "\nSimpson: ", c, " Erro: ", erro_in)

f(x) = x/(x^2+1)
a = iw(f, im, 0, 1, 0.5)
b = iw(f, it, 0, 1, 0.5)
c = iw(f, in, 0, 1, 0.5)
valor_analitico_f = log(2) / 2
erro_im = erro_absoluto(a, valor_analitico_a)
erro_it = erro_absoluto(b, valor_analitico_a)
erro_in = erro_absoluto(c, valor_analitico_a)

println("\nf)f(x) = 1/(x^2+1)\nPonto Médio: ", a, " Erro: ", erro_im, "\nTrapézio: ", b, " Erro: ", erro_it, "\nSimpson: ", c, " Erro: ", erro_in)
println("\n")

# Exercício 9.2.3
f(x) = exp(4 - x^2)

# Funções de integração composta para os métodos: ponto médio, trapézio e Simpson
function ponto_medio(f, a, b, n)
    h = (b - a) / n
    soma = 0.0
    for i in 0:(n-1)
        xi = a + i * h
        x_medio = xi + h / 2
        soma += f(x_medio)
    end
    return h * soma
end

function trapezio(f, a, b, n)
    h = (b - a) / n
    soma = (f(a) + f(b)) / 2
    for i in 1:(n-1)
        xi = a + i * h
        soma += f(xi)
    end
    return h * soma
end

function simpson(f, a, b, n)
    if n % 2 != 0
        println("Para o método de Simpson, n deve ser par.")
        return NaN
    end
    h = (b - a) / n
    soma = f(a) + f(b)
    for i in 1:2:(n-1)
        xi = a + i * h
        soma += 4 * f(xi)
    end
    for i in 2:2:(n-2)
        xi = a + i * h
        soma += 2 * f(xi)
    end
    return (h / 3) * soma
end

ns = [3, 5, 7, 9]
println("Exercício 9.2.3:\nf(x) = e^(4 - x^2)")
println("n\t   Ponto Médio    \t     Trapézio    \t     Simpson")
for n in ns
    ime = ponto_medio(f, 2, 5, n)
    itr = trapezio(f, 2, 5, n)
    # Para Simpson, garantir que n seja par
    is = simpson(f, 2, 5, n + (n % 2))
    println("$n\t$ime\t$itr\t$is")
end
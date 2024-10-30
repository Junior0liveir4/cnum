using SpecialFunctions
using LinearAlgebra

dp(f,x,h) = (f(x+h)-f(x))/h #Diferença finita progressiva de ordem 1
dr(f,x,h) = (f(x)-f(x-h))/h #Diferença finita regressiva de ordem 1
dc(f,x,h) = (f(x+h)-f(x-h))/(2*h) #Diferença finita central de ordem 2

# Exemplo 8.1.1
f(x) = sin(2*x) - (x^2)
r = dp(f, 2, 0.1)
println("Exemplo 8.1.1:")
println(r)

r = dp(f, 2, 0.01)
println(r)

r = dp(f, 2, 10^-12)
println(r)

r = dc(f, 2, 10^-12)
println(r)
print("\n")

# Exercício 8.1.1
f(x) = sin(x)
a = dp(f, 2, 10^-2)
b = dp(f, 2, 10^-3)
c = dr(f, 2, 10^-2)
d = dr(f, 2, 10^-3)
e = dc(f, 2, 10^-2)
g = dc(f, 2, 10^-3)
println("Exercício 8.1.1:  f(x) = sen(x)\nProgressiva ordem 1: ", a, "\nProgressiva ordem 1: ", b, "\nRegressiva ordem 1: ", c, "\nRegressiva ordem 1: ", d, "\nCentral ordem 1: ", e, "\nCentral ordem 1: ", g)
println("\n")

# Exerício 8.1.1
f(x) = exp(-x)
a = dp(f, 1, 10^-2)
b = dp(f, 1, 10^-3)
c = dr(f, 1, 10^-2)
d = dr(f, 1, 10^-3)
e = dc(f, 1, 10^-2)
g = dc(f, 1, 10^-3)
println("Exerício 8.1.1: f(x) = e^-x\nProgressiva ordem 1: ", a, "\nProgressiva ordem 1: ", b, "\nRegressiva ordem 1: ", c, "\nRegressiva ordem 1: ", d, "\nCentral ordem 1: ", e, "\nCentral ordem 1: ", g)
println("\n")

# Exercício 8.1.4
# Dados de entrada e saída
vi = [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
vo = [0.0, 1.05, 1.83, 2.69, 3.83, 4.56, 5.49, 6.56, 6.11, 7.06, 8.29]

# Índices para os pontos vi = 1 e vi = 4.5
i_vi_1 = findfirst(x -> x == 1.0, vi)
i_vi_4_5 = findfirst(x -> x == 4.5, vi)

# Derivadas numéricas para vi = 1 e vi = 4.5 usando as diferenças finitas
h = 0.5  # Intervalo de vi

# Função auxiliar para interpolar vo
function interp_vo(v)
    idx = searchsortedfirst(vi, v) - 1
    t = (v - vi[idx]) / (vi[idx + 1] - vi[idx])
    return vo[idx] * (1 - t) + vo[idx + 1] * t
end

# Ganho para vi = 1 e vi = 4.5
println("Exercício 8.1.4:\nGanho para vi = 1 e vi = 4.5:")

# Diferença progressiva
println("Diferença progressiva:")
gain_dp_vi_1 = dp(interp_vo, 1.0, h)
gain_dp_vi_4_5 = dp(interp_vo, 4.5, h)
println("vi = 1:  ", gain_dp_vi_1)
println("vi = 4.5:  ", gain_dp_vi_4_5)

# Diferença regressiva
println("\nDiferença regressiva:")
gain_dr_vi_1 = dr(interp_vo, 1.0, h)
gain_dr_vi_4_5 = dr(interp_vo, 4.5, h)
println("vi = 1:  ", gain_dr_vi_1)
println("vi = 4.5:  ", gain_dr_vi_4_5)

# Diferença central
println("\nDiferença central:")
gain_dc_vi_1 = dc(interp_vo, 1.0, h)
gain_dc_vi_4_5 = dc(interp_vo, 4.5, h)
println("vi = 1:  ", gain_dc_vi_1)
println("vi = 4.5:  ", gain_dc_vi_4_5)

# Ajuste por mínimos quadrados para vo = a1*vi + a3*vi^3
X = [vi .^ 1 vi .^ 3]  # Matriz de design para o ajuste linear e cúbico
coef = X \ vo  # Coeficientes a1 e a3
a1, a3 = coef[1], coef[2]

# Função ajustada e derivada
f_fit(v) = a1 * v + a3 * v^3
df_fit(v) = a1 + 3 * a3 * v^2  # Derivada da função ajustada

# Ganho analítico usando a função ajustada
println("\nGanho analítico pela função ajustada:")
gain_fit_vi_1 = df_fit(1.0)
gain_fit_vi_4_5 = df_fit(4.5)
println("vi = 1:  ", gain_fit_vi_1)
println("vi = 4.5:  ", gain_fit_vi_4_5)
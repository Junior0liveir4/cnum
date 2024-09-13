using SpecialFunctions
using LinearAlgebra
#Trabalho de Cálculo Numérico
#Aluno: Junior Guimarães de Oliveira

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

function seidel(A, B, k; error, max_iter)
  n = length(B)
  x = copy(k)
  for k in 1:max_iter
    x_old = copy(x)
    for i in 1:n
      sigma = 0.0
      for j in 1:n
        if i != j
          sigma += A[i, j] * x[j]
        end
      end
      x[i] = (B[i] - sigma) / A[i, i]
    end
    if norm(x - x_old, Inf) < error
      return x
    end
  end
end

function fixedpoint(a, g, error)
  x = g(a)
  while norm(x-a) > error
    a = x
    x = g(a)
  end
  return x
end

#Exercício 1
# Para economizar energia elétrica, um agricultor implantou um sistema de painel solar na fazenda para alimentar uma bomba d'água, que faz a irrigação das plantações. A placa negra utilizada fica exposta ao sol e ao vento. Dessa forma, para gerar eletricidade, a irradiação solar E (em Wm-2) sobre a placa tem que ser maior que a perda de calor por radiação e por condução, dado a temperatura atmosférica K (em Kelvin). Sabendo que para determinar a temperatura da placa para alcançar esse desequilíbrio é dado pela equação:

#E = 5,67.10-8 T4 + 0,4(T - K)

#Determine a temperatura mínima da placa, dada a medição da irradiação e da temperatura do ar, sabendo que o valor médio diário é E=500,125 e K=272,975.

e = 500.125
k = 272.975
f(x) = 5.67*10^-8*x^4 + 0.4*(x - k) - e
tol = 10^-4
r = bissection(273, 400, f, tol)
println("Questão 1")
println("Resposta aproximada utilizando o método da bissecção: T = ", r, "\n")

#Exercício 2
#Calcule o comprimento do cabo (C) entre duas torres de transmissão (cabo catenária). A distância entre as torres é de d = 500m. A flecha máxima permitida é fmax = 50m. Flecha é a distância vertical entre uma reta que liga os dois pontos de fixação. A flecha (f) depende do comprimento do vão (d) e da tração (C) aplicada ao cabo. O seu modelo matemático pode ser:

#f = C[cosh(d/2C)-1]

d = 500
fmax = 50
f(x) = x*(cosh(d/(2*x))-1) - fmax
a, b = 0.1, 1000
tol = 1e-10

resposta = bissection(a, b, f, tol)
println("Questão 2")
println("Resposta aproximada utilizando o método da bissecção: C = ", resposta, "\n")

#Exercício 3
#Um retificador de meia onda a diodo alimenta uma carga indutiva resistiva (f = 1 kHz, L = 100 mH e R = 1 kΩ). Encontre o ângulo para o qual a corrente Id no diodo se anula. Considere o seguinte modelo matemático:

#Id = sen(b - a) + sen(a).e[-b/tan(a)]
#tan(a) = 2π.f.L / R

freq = 1e3
L = 100e-3
R = 1e3
tan = 2*pi*freq*L/R     
a_v = atan(tan)

f(x) = sin(x - a_v) + sin(a_v)*exp(-x/tan)
deg2rad(degrees) = degrees * π / 180
rad2deg(radians) = radians * 180 / π

a_degtorad = deg2rad(114) # 2 radianos
b_degtorad = deg2rad(286) # 5 radianos

tol = 1e-10
resposta = bissection(a_degtorad, b_degtorad, f, tol)

println("Questão 3")
println("Resposta aproximada utilizando o método da bissecção: b = ", rad2deg(resposta), "°", "\n")

#Exercício 4
#Em um grande hospital, para se evitar intermitência no sistema elétrico dos diversos equipamentos médicos, instalou-se três reatores de alta performance em série, com tensão nominal R em função da potência máxima P de operação dos enrolamentos de controle:

#17.R1 - 2.R2 - 3.R3 = P1 = 500
#-5.R1 + 21.R2 - 2.R3 = P2 = 200
#-5.R1 - 5.R2 + 22.R3 = P3 = 30
#Obtenha as tensões nominais de cada reator.

A = [17.0 -2.0 -3.0;
     -5.0 21.0 -2.0;
     -5.0 -5.0 22.0]
B = [500.0, 200.0, 30.0]

k = [0.0, 0.0, 0.0]
error = 1e-10
max_iter = 1000
resposta = seidel(A, B, k; error, max_iter)
println("Questão 4")
println("Resposta aproximada utilizando o método de Seidel: R1 = ", resposta[1], " R2 = ", resposta[2], " R3 = ", resposta[3], "\n")

#Exercício 5
#Determine o valor da corrente no resistor R3, sabendo que V1 = V2 = 100 V e R1 = R2 = R3 = 10 Ω.

A = [20.0 10.0;
     10.0 20.0]
B = [100.0, 100.0]

k = [0.0, 0.0]
error = 1e-10
max_iter = 1000
resposta = seidel(A, B, k; error, max_iter)
I1, I2 = resposta
I3 = I1 + I2
println("Questão 5")
println("A corrente no resistor R3 é aproximadamente: I3 = ", I3, " A \n")

#Exercício 6
#Calcule as tensões para os nós, tendo por referência o nó 6. O circuito pode ser equacionado da seguinte maneira:
#{I} = [Y] {V}

A = [
  6 -3 -3 0 0; 
  -3 6 0 -3 0; 
  -3 0 6 -1 -2; 
  0 -3 -1 5 0; 
  0 0 -2 0 3]
B = [0; 6; 0; 2; -3]

k = [0.0, 0.0, 0.0, 0.0, 0.0]
error_vl = 1e-10
max_iter = 1000
resposta = seidel(A, B, k; error, max_iter)
println("Questão 6")
println("Resposta aproximada utilizando o método de Gauss-Seidel: V1 = ", resposta[1], " V2 = ", resposta[2], " V3 = ", resposta[3], " V4 = ", resposta[4], " V5 = ", resposta[5], "\n")

#Exercício 7
#Num sistema de energia solar, um vetor de equilíbrio energético E, na placa absorvente e na placa de vidro, segue o seguinte sistema de equações não lineares nas temperaturas (K/m²) absolutas da placa absorvente (T1) e da placa de vidro (T2):
# (T41+ 0,06823.T1)−(T42+ 0,05848.T2) = E1
# (T41+ 0,05848.T1)−(2.T42+ 0,11696.T2) = E2
# Calcule o valor aproximado das temperaturas de equilíbrio, sabendo que os valores de equilíbrio energético foram medidos experimentalmente em E1=0,01753 E2=0,00254.

g(x) = x - inv(jacobian(x))*F(x)

F(x) = [x[1]^4 + 0.06823*x[1] - x[2]^4 - 0.05848*x[2] - 0.01753;
        x[1]^4 + 0.05848*x[1] - 2*x[2]^4 - 0.11696*x[2] - 0.00254]

jacobian(x) = [4*x[1]^3 + 0.06823 -4*x[2]^3 - 0.05848;
               4*x[1]^3 + 0.05848 -8*x[2]^3 - 0.11696]

x = [0.5, 0.5]
error = 1e-10
resposta = fixedpoint(x, g, error)
println("Questão 7")
println("Resposta aproximada utilizando o método de Newton-Raphson: T1 = ", resposta[1], " T2 = ", resposta[2], "\n")
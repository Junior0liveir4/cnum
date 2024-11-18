using LinearAlgebra
#Trabalho 2 de Cálculo Numérico
#Aluno: Junior Guimarães de Oliveira
#Aluno: Eduarda Cipriano
#Aluno: Miguel Grigorio

"""
Exercício 1
Uma fábrica de laticínios, na etapa de resfriamento para fermentação dos produtos, utiliza diferentes tamanhos de serpentinas para alcançar as temperaturas ideais no processo de fabricação. De acordo com o manual do fabricante, as serpentinas seguem precisamente a fórmula para calcular a temperatura alcançada (em graus celsius) em função do tamanho (em metros) da serpentina:

f(x) = a[4]*x^3+a[3]x^2+a[2]^x+a[1]

A tabela abaixo contém as temperaturas na primeira linha, os metros de serpentina na segunda linha e o tamanho das novas serpentinas na terceira linha. Encontre os valores das temperaturas alcançadas para essas novas serpentinas.
Sugestão: usar o método da interpolação polinomial.
"""

matrix_1(x) = [
  1 x[1] x[1]^2 x[1]^3;
  1 x[2] x[2]^2 x[2]^3;
  1 x[3] x[3]^2 x[3]^3;
  1 x[4] x[4]^2 x[4]^3
]

sistema(x, y) = matrix_1(x) \ y

temp = [4.9; 3.3; 3.0; 2.0]
tamanho = [1.5; 2.0; 2.2; 3.0]
new_tam = [1.75; 2.5; 2.75; 3.2]

coeficientes = sistema(tamanho, temp)

func1_polinomial(x) = coeficientes[1] + coeficientes[2]*x + coeficientes[3]*x^2 + coeficientes[4]*x^3

new_temp = [func1_polinomial(x) for x in new_tam]

println("Exercício 1: ")
println("Temperaturas: ") 

for i in new_temp
print(round(i, digits=2), " ")
end

"""
Exercício 2
Suponha que você tenha um circuito RL em série com uma fonte de tensão constante V, resistência R e indutância L. A corrente I(t) é medida nos seguintes instantes de tempo:

0.2s = 0.8187 A
0.5s = 1.5815 A
0.7s = 1.9354 A
1s = 2.2905 A

Estime a corrente nos tempos t = 0.3s e t = 0.9s.
Sugestão: usar o método da interpolação polinomial.
"""

matrix_2(x) = [
  1 x[1] x[1]^2 x[1]^3;
  1 x[2] x[2]^2 x[2]^3;
  1 x[3] x[3]^2 x[3]^3;
  1 x[4] x[4]^2 x[4]^3;
]

tempo = [0.2; 0.5; 0.7; 1]
corrente = [0.8187; 1.5815; 1.9354; 2.2905]
new_tempo = [0.3; 0.9]

sistema(x, y) = matrix_2(x) \ y

coeficientes = sistema(tempo, corrente)

func2_polinomial(x) = coeficientes[1] + coeficientes[2]*x + coeficientes[3]*x^2 + coeficientes[4]*x^3

new_corrente = [func2_polinomial(x) for x in new_tempo]

println("\n\nExercício 2: ")
println("Correntes: ")
for i in new_corrente
  print(round(i, digits=6), " ")
end

"""
Exercício 3
Uma fábrica de chuveiros tem um modelo especial com quatros modos de temperatura (verão, outono, inverno, primavera), que variam devido a diferentes resistências.
Encontre o modelo matemático linear:

f(x)=a[2]x+a[1]

De cada resistência, sendo x em cm e f(x) em graus celsius, dado que alguns valores foram medidos experimentalmente (o modelo verão não usa resistência).
A tabela abaixo contém a matriz com as medições de temperatura na primeira linha e os centímetros das resistências na segunda linha.

Encontre os valores de a1 e a2 de cada resistência.
Sugestão: usar o método de quadrados mínimos.
"""

#Outono
temp_outono = [38, 40, 42, 44, 46]
resist_outono = [1, 1.25, 1.5, 1.75, 2]

#Inverno
temp_inverno = [40, 44, 48, 52, 56]
resist_inverno = [1, 1.5, 2, 2.5, 3]

#Primavera
temp_primavera = [36, 39, 42, 45, 48]
resist_primavera = [1, 1.15, 1.3, 1.45, 1.6]

function curve_adjustment(b, x, y)
    V_transpose = transpose(b(x))
    a = inv(V_transpose*b(x))*(V_transpose*y)
    return a
end

matrix_3(x) = [
    1 x[1];
    1 x[2];
    1 x[3];
    1 x[4];
    1 x[5];
]

outono = curve_adjustment(matrix_3, resist_outono, temp_outono)
inverno = curve_adjustment(matrix_3, resist_inverno, temp_inverno)
primavera = curve_adjustment(matrix_3, resist_primavera, temp_primavera)

println("\n\nExercício 3:")
println("Outono: f(x) = ", round(outono[2], digits=2), "x + ", round(outono[1], digits=2))
println("Inverno: f(x) = ", round(inverno[2], digits=2), "x + ", round(inverno[1], digits=2))
println("Primavera: f(x) = ", round(primavera[2], digits=2), "x + ", round(primavera[1], digits=2))

"""
Exercício 4
Um conversor de potência DC-DC foi testado em várias condições de carga. Para cada condição, foram medidos valores da tensão V e da corrente I. Como parte da análise do sistema, deseja-se determinar a resistência equivalente Req.

V=Req*I+b

b é uma constante de ajuste.

Os dados de medição são:
5.1 V = 0.5 A
10.3 V = 1.1 A
15.2 V = 1.5 A
20.1 V = 2.2 A
24.7 V = 2.5 A
30.5 V = 3.1 A

Estime Req e b.
Sugestão: usar o método de quadrados mínimos.
"""

tensao = [5.1; 10.3; 15.2; 20.1; 24.7; 30.5]
corrente = [0.5; 1.1; 1.5; 2.2; 2.5; 3.1]

matrix_4(x) = [
    1 x[1];
    1 x[2];
    1 x[3];
    1 x[4];
    1 x[5];
    1 x[6];
]

answer = curve_adjustment(matrix_4, corrente, tensao)

println("\n\nExercício 4: ")
println("f(x) = ", round(answer[2], digits=7), "x + ", round(answer[1], digits=8))

"""
Exercício 5
Considere um circuito RL em série com um resistor R e um indutor L, onde a corrente I(t) varia ao longo do tempo em resposta a uma fonte de tensão variável V(t). A relação entre a tensão, corrente, resistência e indutância é dada por:

V(t)=L*d((I(t))/dt+R*I(t)

onde:
R = 5 ohm
L = 0.1 H

As medições de corrente I(t) foram feitas nos seguintes instantes:
0.0s = 0.00 A
0.1s = 0.82 A
0.2s = 1.36 A
0.3s = 1.60 A
0.4s = 1.73 A

Sabendo que a corrente está crescendo em função linear do tempo (ajuste), estime a tensão V no instante t = 0.5s
Sugestão: usar o método da diferença finita progressiva.
"""

diff_progressive(f, x, h) = (f(x + h) - f(x))/h
diff_regresive(f, x, h) = (f(x) - f(x - h))/h
diff_central(f, x, h) = (f(x + h) - f(x - h))/(2*h)

matrix_5(x) = [
    1 x[1];
    1 x[2];
    1 x[3];
    1 x[4];
    1 x[5];
]

tempo = [0.0; 0.1; 0.2; 0.3; 0.4]
corrente = [0.00; 0.82; 1.36; 1.60; 1.73]

coeficientes = curve_adjustment(matrix_5, tempo, corrente)

func3_polinomial(x) = coeficientes[2]*x + coeficientes[1]

R = 5
L = 0.1
h = 0.001

tensao = L*diff_progressive(func3_polinomial, 0.5, h) + R*func3_polinomial(0.5)

println("\n\nExercício 5: ")
println("Tensão: ", round(tensao, digits=5))

"""
Exercício 6
Refaça a tarefa anterior, sabendo que a corrente está crescendo em função quadrática do tempo.
Sugestão: usar o método da diferença finita regressiva.
"""

matrix_6(x) = [
  1 x[1] x[1]^2;
  1 x[2] x[2]^2;
  1 x[3] x[3]^2;
  1 x[4] x[4]^2;
  1 x[5] x[5]^2;
]

coeficientes = curve_adjustment(matrix_6, tempo, corrente)

func4_polinomial(x) = coeficientes[3]*x^2 + coeficientes[2]*x + coeficientes[1]

tensao = L*diff_regresive(func4_polinomial, 0.5, h) + R*func4_polinomial(0.5)

println("\n\nExercício 6: ")
println("Tensão: ", round(tensao, digits=5))

"""
Exercício 7
Refaça a tarefa anterior, sabendo que a corrente está crescendo em função cúbica do tempo.
Sugestão: usar o método da diferença finita central.
"""

matrix_7(x) = [
  1 x[1] x[1]^2 x[1]^3;
  1 x[2] x[2]^2 x[2]^3;
  1 x[3] x[3]^2 x[3]^3;
  1 x[4] x[4]^2 x[4]^3;
  1 x[5] x[5]^2 x[5]^3;
]

coeficientes = curve_adjustment(matrix_7, tempo, corrente)

func5_polinomial(x) = coeficientes[4]*x^3 + coeficientes[3]*x^2 + coeficientes[2]*x + coeficientes[1]

tensao = L*diff_central(func5_polinomial, 0.5, h) + R*func5_polinomial(0.5)

println("\n\nExercício 7: ")
println("Tensão: ", round(tensao, digits=5))

"""
Exercício 8
Uma empresa de saneamento pública realiza o cálculo de micro drenagem das ruas por meio da pluviosidade das águas de chuva em função do raio da manilha, dado pela fórmula:

P(r) = 3*(1 - (r/4))^1/7

É necessário saber a quantidade de água de chuva por segundo suportada por cada manilha, dado pela fórmula:

Q(r) = 2*π ∫ r*P(r) dr

A tabela abaixo contém o valor do raio. Encontre a quantidade de água de chuva por segundo suportada por cada manilha.
1.25m = 14.235493
2.55m = 56.396741
3.15m = 83.297811
3.95m = 121.398311

Sugestão: usar o método das regras de quadratura.
"""

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

function ponto_medio(f, a, b)
  h = b - a
  return h*(f((a+b)/2))
end

P(r) = 3(1-(r/4))^(1/7)

Q(r) = 2*pi*iw(P, ponto_medio, 0, r, 0.5)

println("\n\nExercício 8: ")
println("Q(1.25): ",  round(Q(1.25), digits=6))
println("Q(2.55): ",  round(Q(2.55), digits=6))
println("Q(3.15): ",  round(Q(3.15), digits=6))
println("Q(3.95): ",  round(Q(3.95), digits=6))

"""
Exercício 9
Refaça a tarefa anterior, pela regra do trapézio.
"""

function trapezio(f, a, b)
  h = b - a
  return h*(((1/2)*f(a))+((1/2)*f(b)))
end

Q(r) = 2*pi*iw(P, trapezio, 0, r, 0.5)

println("\n\nExercício 9: ")
println("Q(1.25): ",  round(Q(1.25), digits=6))
println("Q(2.55): ",  round(Q(2.55), digits=6))
println("Q(3.15): ",  round(Q(3.15), digits=6))
println("Q(3.95): ",  round(Q(3.95), digits=6))

"""
Exercício 10
Refaça a tarefa anterior, pela regra de Simpson.
"""

function simpson(f, a, b)
  h = (b - a) / 2
  return h*(((1/3)*f(a))+((4/3)*f((a+b)/2))+((1/3)*f(b)))
end

Q(r) = 2*pi*iw(P, simpson, 0, r, 0.5)

println("\n\nExercício 10: ")
println("Q(1.25): ",  round(Q(1.25), digits=6))
println("Q(2.55): ",  round(Q(2.55), digits=6))
println("Q(3.15): ",  round(Q(3.15), digits=6))
println("Q(3.95): ",  round(Q(3.95), digits=6))

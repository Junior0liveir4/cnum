# **Atividades da matéria de Cálculo Numérico**

## 1 - Linguagem Julia:

Documentação oficial da linguagem, exemplos e informações avançadas

https://julialang.org/

### Compilador Online:

https://www.tutorialspoint.com/execute_julia_online.php

## 2 - Erro com pontos flutuantes

https://www.ufrgs.br/reamat/CalculoNumerico/livro-py/rdneadm.html

Neste capítulo, abordaremos formas de representar números reais em computadores. Iniciamos com uma discussão sobre representação posicional e mudança de base. Então, enfatizaremos a representação de números com quantidade finita de dígitos, mais especificamente, as representações de números inteiros, ponto fixo e ponto flutuante em computadores.
A representação de números e a aritmética em computadores levam aos chamados erros de arredondamento e de truncamento.

+ **Exercícios**

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/pontos%20flutuantes.PNG)

## 3 - Método da Bisseção

https://www.ufrgs.br/reamat/CalculoNumerico/livro-py/sdeduv-metodo_da_bissecao.html

O método da bisseção explora o fato de que uma função contínua deverá ter um zero em algum intervalo de dois pontos em que a imagem alterna entre um valor positivo e negativo. Assim, a ideia para aproximar o zero da função é tomar, como primeira aproximação, o ponto médio desse intervalo, e, sucessivamente, para os intervalos entre esses pontos médios, até encontrar o valor próximo ao zero.

+ **Exercícios**

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/bissection1.PNG)

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/bissection2.PNG)

## 4 - Métodos de Ponto Fixo

Ponto fixo de uma função é quando o valor do domínio corresponde ao mesmo valor da imagem. Dessa forma, o método consiste em repetir sucessivamente uma função de interação até se encontrar o ponto fixo, que corresponderá ao zero da função original. O método de Newton-Raphson utiliza-se do método do ponto fixo por meio da equação da reta tangente (derivada) da função. O método da secante é uma variação de Newton-Raphson, em que a sequência de raízes de linhas secantes é usada para aproximar o valor do ponto fixo.

+ ### Iteração de ponto fixo

https://www.ufrgs.br/reamat/CalculoNumerico/livro-py/sdeduv-iteracao_de_ponto_fixo.html

Nesta seção, discutimos a abordagem da iteração do ponto fixo para a solução numérica de equações de uma variável real. O teorema do ponto fixo nos fornece condições suficientes para a existência e unicidade do ponto fixo, bem como para a convergência das iterações do método.

+ **Exercício**

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/ponto%20fixo.PNG)

+ ### Método de Newton-Raphson

https://www.ufrgs.br/reamat/CalculoNumerico/livro-py/sdeduv-metodo_de_newton-raphson.html

Nesta seção, apresentamos o método de Newton-Raphson para calcular o zero de funções reais de uma variável real.

+ **Exercício**

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/newton-raphson.PNG)

+ ### Método das Secantes

https://www.ufrgs.br/reamat/CalculoNumerico/livro-py/sdeduv-metodo_das_secantes.html

O método das secantes é uma variação do método de Newton, evitando a necessidade de conhecer-se a derivada analítica de f(x).

+ **Exercícios**

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/secantes.PNG)

## 5 - Métodos de Gauss

O método de Gauss é um escalonamento de sucessivas operações elementares num sistema linear quadrático, a partir da matriz superior triangular correspondente, para resolução desse sistema linear. Os métodos de Gauss-Jacobi e Gauss-Seidel usam uma aproximação inicial da solução para esses sistemas.

https://www.ufrgs.br/reamat/CalculoNumerico/livro-py/sdsl.html

+ **Exercícios**

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/4.7.2.png)

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/4.7.5.png)

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/4.9.1.png)

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/4.9.2.png)

## 6 - Resolução de Sistemas não Lineares

Para os sistemas não lineares a demonstração da unicidade de zeros é limitada por soluções analíticas, sendo usado o método iterativo de Newton-Raphson adaptado aos sistemas de equações, envolvendo aproximações iniciais, cálculo da matriz do Jacobiano e critério de parada.

https://www.ufrgs.br/reamat/CalculoNumerico/livro-py/sdsdenl.html

+ **Exercícios**

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/5.1.2.png)

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/5.1.5.png)

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/5.1.10.png)

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/5.1.12.png)

## 7 - Trabalho 1

Em dupla ou trio, faça de acordo com a especificação do trabalho, usando os conceitos de método da bisseção, métodos de ponto fixo, métodos de Gauss e resolução de sistemas não lineares.

## 8 - Interpolação

O problema consiste em encontrar alguma função que satisfaça determinados domínios e contradomínios. A interpolação polinomial é o método para encontrar, a partir de contradomínios reais, o polinômio que os satisfazem.

https://www.ufrgs.br/reamat/CalculoNumerico/livro-py/i1.html

+ **Exercícios**

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/interpolacao.PNG)

## 9 - Ajuste de Curvas

O problema consiste em encontrar uma função que melhor se ajusta aos pontos dados, não necessariamente que os interpola, geralmente usando o método dos mínimos quadrados (em estatística, a técnica é mais conhecida como regressão).

https://www.ufrgs.br/reamat/CalculoNumerico/livro-py/adc.html

+ **Exercícios**

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/ajuste%20de%20curvas%20-%201.PNG)

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/ajuste%20de%20curvas%20-%202.PNG)

## 10 - Derivação Numérica

O problema consiste em encontrar estratégias numéricas para aproximação de derivadas de funções reais, em específico, as aproximações por diferenças finitas.

https://www.ufrgs.br/reamat/CalculoNumerico/livro-py/dn-diferencas_finitas.html

+ **Exercícios**

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/8.1.1.png)

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/8.1.4.png)

## 10 - Integração Numérica

O problema consiste em encontrar estratégias numéricas para aproximação de integrações de funções reais, em específico, regras de quadratura.

https://www.ufrgs.br/reamat/CalculoNumerico/livro-py/in.html

+ **Exercícios**

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/9.2.1.png)

![print-appGallery](https://github.com/Junior0liveir4/cnum/blob/main/Exerc%C3%ADcios/9.2.3.png)

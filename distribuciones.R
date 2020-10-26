##################################################
######   Distribución Uniforme         ###########
##################################################

#La probabilidad de ocurrencia sobre un inveralo es igual y constante
#ej
#Vas a tomar un elevador, Este toma entre 0 y 40 en llegar.
#Asume que el elevador llega uniformemente entre 0 y 40 segundos 
#despues que presionas el boton.
#a = 0, b = 40

# f (X = x)
curve(dunif(x, min = 0, max = 40), xlim = c(0, 40))

# P ( X < x)
curve(punif(x, min = 0, max = 40), xlim = c(0, 40))

# P (X < a) = q
curve(qunif(x, min = 0, max = 40), xlim = c(0, 1))

##################################################
######   Distribución Binomial         ###########
##################################################

#Se repite n veces un experimento con probabilidad p
#Se desea saber la probabilidad de que x eventos ocurran
#dbinom(x, n, p)

#ej 
#Se sabe que un futbolista acierta el 60% de las veces que dispara al arco
#Si en un partido el futbolista dispara al arco 6 veces

barplot(dbinom(0:6, 6, 0.6), names.arg = 0:6)

#Probabilidad de que haya metido solo 3 goles en todo el partido  
#P(X = 3)
dbinom(3, 6, 0.6)

#Probabilidad de que haya metido mas de 2 goles en todo el partido

# 1 - P(X <= 2)
1 - pbinom(2, 6, 0.6)

#Asi se ve la funcion acumulada
barplot(pbinom(0:6, 6, 0.6), names.arg = 0:6)

##################################################
######   Distribución Hipergeometrica  ###########
##################################################

#Se tienen N elementos, en estos N elementos hay dos grupos diferenciables
#K son de un grupo de interes y N-K son del otro grupo 
#se toman n elementos de estos N
#queremos saber la probabilidad obtener x elementos sobre los K de interes

#ej
#Se hace un sorteo de 5 premios entre 100 personas mayores de edad
#se dieron cuenta que 15 niños mintieron sobre su edad
#se desea saber la probabilidad de escoger los niños
#N = 100, K = 15, N-K = 85

#La probabilidad de que los 5 premios se lo ganen los 5 niños es casi cero
#La probabilidad que aparece en 6 es cero porque es imposible ya es la probabilidad
#de que se seleccionen 6 niños, pero solo hay 5 premios
barplot(dhyper(0:6, 15, 85, 5), names.arg = 0:6)

# Probabilidad de que mas de un niño gane un premio?
#p(x = 1) + p(x = 2) ... + p(x = 5)
sum(dhyper(1:5, 15, 85, 5))

#o tambien
#p(x > 0)  = 1 - P(x <= 0)
1 - phyper(0, 15, 85, 5)

##################################################
######   Distribución Poisson          ###########
##################################################

#Se sabe el promedio λ de ocurrencias de un evento durante un intervalo
#x será el numero de ocurrencia en el que estamos interesados

#ej
#Se sabe que en cierto observatorio astronomico se descubren 
#en promedio 2 planetas cada mes

#distribucion poisson de los descubrimientos en un mes
barplot(dpois(0:8, 2), names.arg = 0:8)

#Se desea saber cuantos descubrimientos pueden pasar en 5 años
#se hace una regla de 3
#5 años = 60 meses
#el nuevo lambda seria λ = 2*60 = 120

barplot(dpois(80:160, 120), names.arg = 80:160)

#la probabilidad de que haya mas de 130 descubrimientos durante estos 5 años es
#P(X > 130) = 1 - P(X <= 130)
1- ppois(130, 120)

#o tambien como es discreta, la suma desde 131 hasta un 
#numero grande donde la probabilidad sea casi 0

sum(dpois(131:170, 120))


##################################################
######   Distribución Exponencial      ###########
##################################################

#Se sabe el tiempo medio entre ocurrencias de un evento  
#y se desea saber el tiempo que debe pasar hasta que ocurra este evento

#ej
#siguiendo el ejemplo anterior en el que en un mes ocurren promedio dos descubrimientos
#se desa saber el tiempo hasta que haya un nuevo descubrimiento de un planeta

# x siendo el tiempo en meses
curve(dexp(x, rate = 1/0.5), xlim= c(0, 8))

# rate = 1/λ 

#Probabilidad que durante un mes se presente un descubrimiento
# rate = 1/0.5 porque cada 0.5 meses se descubre un planeta en promedio
pexp(1, rate=1/0.5)

#el promedio es 0.5 meses que equivale a 15 dias
pexp(30, rate=1/15)

##################################################
######   Distribución Gamma            ###########
##################################################

#Tenemos la misma tasa de ocurrencia y queremos hallar probabilidades 
#sobre el tiempo hasta que ocurran alpha eventos independientes

#alpha = shape
curve(dgamma(x, shape = 3, rate=1/0.5), xlim = c(0, 6))

#Se puede ver con el ejemplo que si es solo un evento independiente equivaldria a 
#una distribucion exponencial

#Probabilidad de que halla un descubrimiento durante un dia
pgamma(1/30, shape = 1, rate=1/0.5)
pexp(1/30, rate=1/0.5)

##################################################
######   Distribución Normal           ###########
##################################################

#Una poblacion se distribuye normalmente con media y desviacion estandar
#donde el 50% de la poblacion está bajo la media

#ej
#Las estaturas de una poblacion se distribuyen normalmente con media 165 cm
#y desviacion estandar de 10 cm

curve(dnorm(x, mean= 165, sd = 10), xlim = c(130, 200))

#Aproximadamente 6.6% de las personas miden mas de 1.8m
1 - pnorm(180, mean= 165, sd = 10)

#el otro 6.6% miden 1.49m o menos
qnorm(0.066, mean= 165, sd = 10)

#Estandarizando para usar la normal estandar

Z <- (180 - 165)/10
1 - pnorm(Z)
#Nos da el mismo resultado

(qnorm(0.066)*10) + 165
#el 6.6% de personas mide menos de 1.49, nos da lo mismo pero usando la normal estandar

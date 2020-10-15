import math
def factorial(x):
        
    if x < 0:
        return -1
    elif x == 0:
        return 1
    else:
        n = 1
        while x > 0:
            n = n * x
            x = x - 1
        return(n)
        

def choose(n, k):
    return (factorial(n)/(factorial(k)*factorial(n-k)))

def bin(x, n, p):
    r = choose(n, x) * p**x * (1-p)**(n-x)
    return round(r, 8)

def pbin(x, n, p):
    s = 0
    for i in range(0, x + 1):
        s = s + (choose(n, i) * p**i * (1-p)**(n-i))
    return round(s, 8)

def bininfo(n, p):
    var = str(round(n*p*(1-p), 7))
    return "Expected value: " +  str(n*p)+ ", Variance: " + var

def pois(x, l):
    c = (math.e**(-l)* l**x)/factorial(x)
    return round(c, 7)

def ppois(x, l):
    c = 0
    for i in range(0, x+1):
        c = c + (math.e**(-l)* l**i)/factorial(i)
    return round(c, 7)
#Práctica 4: Ping-Pong.

>   Daniel Camba Lamas y Román Puga Quintairos.

##4.4

Se han implementado los siguientes criterios de parada:

```java
if(Master.value >= 25)
if(now > Master.stop)
```

##4.5

`wait()`, pone al hilo a la espera de una próxima notificación.

`notify()`, avisa sólo al hilo del objeto que realiza la llamada.

`notifyAll()`, alerta a todos los hilos de esa clase.

## 4.6

El arbitro define el jugador que inicia la partida utilizando la variable `turn`, lo cual disparará el juego.

## 4.7

Visualmente estamos comprobando que el orden de jugadores es correcto y las paradas del juego se cumplen cuando se desea. Para automatizar este proceso de comprobación podrían generarse mediante Test Unitarios o Scripts AWK del log de nuestro programa verificando que genera la salida deseada.

## 4.8

Esperabamos que el tiempo fuera idéntico en todos los casos pero la creación de los jugadores (*hilos*) supone un decremento de la eficiencia.

E.G (*Los datos son aproximados y en función del equipo*):

-   Para 3 jugadores: 89ms.
-   Para 600 jugadores: 289ms.
-   Para 1500 jugadores: 679ms.

## 4.9

Que nunca podrán entrar al juego porque ahora mismo las llamadas van en orden, una solución podría ser que si pasa un determinado tiempo sin que la bola se golpee, se pase a al siguiente jugador o una comprobación de si el objeto al que se va llamar sigue en el juego. 

## 4.10

Sí, se permite debido a que en el caso de que sólo exista un jugador este puede notificarse a si mismo el haber golpeado la bola.
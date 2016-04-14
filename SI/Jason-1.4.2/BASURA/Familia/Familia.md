#RELACIONES FAMILIARES.

##1) ¿ Cual es la complejidad de, utilizando esta representación de una familia, decidir si una persona cualquiera es pariente o no de una que figure en la base de conocimiento ?

Dado que estamos ante un arbol binario la complejidad de su busqueda se resuelve en un orden entre **[log~2~(N+1)]** y **N** .



## 2) El problema anterior ¿es comparable, más simple o más complejo que calcular la ruta más corta entre dos ciudades? ¿Por qué?

```
NOTA: Considerar el problema de decidir si una ciudad se encuentra o no en la ruta más corta entre dos ciudades. 
```

Tomando Dijkstra como resolución, su complejidad es del orden de **N^2^**,  por lo que el tiempo consumido es mayor que el de nuestro problema de orden logarítmico.



## 3) ¿Es correcta la caracterización dada para computar el conjunto de todos los parientes de cualquier miembro de la base de conocimiento? 

    NOTA: para computar los parientes de cada miembro basta sustituir el hecho yo(eve) por el correspondiente

Resuelve para todos los casos de la forma esperada.



## 4) ... Resuelta en el archivo `yo.asl`



## 5) ¿Que complejidad tiene la solución? ¿Que problema sobre recorrido de grafos puede usarse para caracterizar dicha solución?

O(2^n^), resolución mediante Backtracking.
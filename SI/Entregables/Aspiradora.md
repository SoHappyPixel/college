>   Daniel Camba Lamas: danicamba@me.com

## 1.

Uno `reactivo` y otro `reactivo - deliberativo` el primero es el *incinerador* ya que su ejecución se limita al instante en el que recibe basura. el segundo es el *recogedor* el cual reacciona al encontrar **basura** en una casilla, para llevársela al *incinerador*, pero mientras está recorriendo de manera secuencial todo el tablero. Para mejorar la eficiéncia el *incinerador* podría ir con el *recogedor*, a la par o en la misma casilla.

## 2.

No, ya que cada vez que cada vez que encuentra basura la lleva al incinerador para luego regresar al mismo punto. Sería  mejor que se realizara un único viaje al incinerador tras recoger toda la basura.

## 3.

Si el desplazamiento fuera parejo al del *recogdor* el programa ganaría en eficiencia, si fuera aleatorio habría una pequeña posibilidad de que en algunos casos fuera más eficiente y si el *incinerador* se moviera por ejemplo al contrario o en espejo, sería absolutamete ineficiente.

## 4.

La ejecución del *recogedor* es lineal así que si la basura queda en una casilla anterior al recorrido que le corresponde, nunca la recogera.

## 5.

De forma que exige una restructuración de la ejecución del *recogedor* de forma que no sea tan lineal, si no reactiva al hecho de que aparezca basura para que la matriz esté siempre limpia.
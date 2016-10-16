/* Ejercicio 1 */

get_asoc(Llave,[Llave,Valor],Valor).
get_asoc(Llave,[Car|_],R):-get_asoc(Llave,Car,R),!.
get_asoc(Llave,[_|Cdr],R):-get_asoc(Llave,Cdr,R).


/* Ejercicio 2 */

escalar([],[],0).
escalar([Car1|Cdr1],[Car2|Cdr2],R):-escalar(Cdr1,Cdr2,Elem),R is Car1*Car2+Elem.



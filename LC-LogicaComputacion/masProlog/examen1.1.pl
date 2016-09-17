/*Examenes parte 1*/
/*a*/
/*Ejercicio 1*/
/*get_asoc(Llave,ListAsoc,Valor)*/
/*:- get_asoc(b,[[a,1],[b,2],[c,3]],X). es X=2*/

get_asoc(_,[],[]).
get_asoc(Llave,[[Llave,Valor]|Cdr],Valor):-!.
get_asoc(Llave,[_|Cdr],Valor):-get_asoc(Llave,Cdr,Valor).

/*get_asoc(Llave,[Llave|Valor],Valor).*/
/*get_asoc(Llave,[Car|_],R):-get_asoc(Llave,Car,R),!.*/
/*get_asoc(Llave,[_,Cdr],R):-get_asoc(Llave,Cdr,R).*/

/*Ejercicio 2*/		
/*escalar(Lista1,Lista2,Resultado)*/
/*:- escalar([1,2,3],[4,5,6], X) es X=32, donde 32=1*4+2*5+3*6.*/

escalar([],[],0).
escalar([],_,0).
escalar([Car1|Cdr1],[Car2|Cdr2],R):-escalar(Cdr1,Cdr2,Elem),R is Car1*Car2+Elem.
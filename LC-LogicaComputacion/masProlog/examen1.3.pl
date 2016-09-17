/*c*/
/*Ejercicio 1*/
/*borrar_unicos(Lista,Resultado)*/
/*borrar_unicos([1,2,[3,4],2,3,4,1],X)  es X=[1,2].*/

comp(_,[],[]).
comp(Conj,[Car|Cdr],R):-miembro(Car,Conj),!,comp(Conj,Cdr,R).
comp(Conj,[Car|Cdr],[Car|R]):-comp(Conj,Cdr,R).

borrar_unicos(Lista,R):-borrar_repes(Lista,Unicos),comp(Unicos,Lista,R).

/*Ejercicio 2*/
/*anadir(Elem, Conj, Result)*/
/*anadir(1,[4,5,6], X) es X=[1,4,5,6]*/

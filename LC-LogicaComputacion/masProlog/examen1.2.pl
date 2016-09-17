/*b*/
/*Ejercicio 1*/
/*eliminar(Lista,Posicion,Resultado)*/
/*:-eliminar([a,b,c,d,e,f,g,h,i],3,X) es X = [a,b,d,e,f,g,h,i].*/

eliminar(L1,Pos,L2):-eliminar(L1,Pos,L2,Pos).
eliminar([],_,[ ],_).
eliminar([_|Cdr],Pos,R,1):-eliminar(Cdr,Pos,R,Pos).
eliminar([Car|Cdr],Pos,[Car|R],P):-P>1,P1 is P-1,eliminar(Cdr,Pos,R,P1).

/*eliminar(L1,0,L1).*/
/*eliminar([Car|Cdr],1,Cdr).*/
/*eliminar([Car|Cdr],L,R):-eliminar([Cdr],W,R),W is L-1.*/

/*Ejercicio 2*/
/*insertceros(Lista,Resultado)*/
/*insertceros([1,2,[3,4],5],X) es X = [1,0,2,0,[3,4],0,5,0]./

insertceros([],[]).
insertceros([Car|Cdr],[Car,0|R]):-insertceros(Cdr,R).

/*insertaceros([],[]).*/
/*insertaceros([Car|Cdr],[Car,0|R]):-insertaceros(Cdr,R).*/

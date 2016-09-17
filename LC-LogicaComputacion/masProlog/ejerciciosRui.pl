nat(0).
nat(s(X)):-nat(X).
/*
par(X) es true si X es par
*/
par(0).
par(s(s(X))):-par(X).

impar(s(0)).
impar(1).
impar(s(s(X))):-impar(X).

suma(0,N,N).
suma(s(N1),N2,s(N3)):-suma(N1,N2,N3).

mult(0,_,0).
mult(s(X),Y,W):-mult(X,Y,Z),suma(Z,Y,W).

exp(_,0,s(0)).
exp(X,s(Y),W):-exp(X,Y,Z),mult(X,Z,W).

lista([]).
lista([_|Cdr]):-lista(Cdr).

miembro(Car, [Car|_]):-!.%corte verde
miembro(X,[_|Cdr]):-miembro(X,Cdr).

longitud([],0).
longitud([_|Cdr],X):-longitud(Cdr,Y),Y is X+1.

ultimo([Car],Car).
ultimo([_|Cdr],X):-ultimo(Cdr,X).

iguales([],[]).
iguales([Car|Cdr],[Car|Cdr]).

concat([],X,X).
concat([Car|Cdr1],Y,[Car|L]):-concat(Cdr1,Y,L).

inv([],[]).
inv([Car|Cdr],R):- inv(Cdr,T), concat(T,[Car],R).

conjunto([]).
conjunto([Car|Cdr]):-miembro(Car,Cdr),!,fail.
conjunto([_|Cdr]):-conjunto(Cdr).

subconj([],_).
subconj([Car,Cdr],C):-miembro(Car,C),subconj(Cdr,C).

igualconj(C1,C2):- subconj(C1,C2),subconj(C2,C1).

interseccion([],[_|_],[]).
interseccion([Car|Cdr],C,[Car|T]):- miembro(Car,C),!,interseccion(Cdr,C,T).
interseccion([_|Cdr],C,T):- interseccion(Cdr,C,T).

union([],[Car|Cdr],[Car|Cdr]).
union([Car|Cdr],C,T):- miembro(Car,C),!,union(Cdr,C,T).%corte rojo
union([Car|Cdr],C,[Car|T]):-union(Cdr,C,T).
/*no hecho en clase*/
inferior(0,0):-!,fail.
inferior(0,N):-nat(N).
inferior(s(N1), s(N2)):-inferior(N1,N2).

modulo(D1,D2,D1):- inferior(D1,D2),!.
modulo(D1,D2,R):- suma(P,D2,D1), modulo(P,D2,R).














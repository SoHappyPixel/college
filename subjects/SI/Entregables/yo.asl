yo(erik).

// --- ORIGINAL.
/* Relaciones paternales */
es_padre_de(fred,erik).
es_padre_de(fred,tom).
es_padre_de(erik,eve).
es_padre_de(bob,liz).
es_padre_de(john,fred).
es_padre_de(john,karl).
/* + */
es_padre_de(john,mamama).
es_padre_de(karl,jonas).
/* Relaciones maternales */
es_madre_de(liz,erik).
es_madre_de(liz,tom).
es_madre_de(sally,liz).
es_madre_de(ann,fred).
es_madre_de(ann,karl).
es_madre_de(july,eve).
/* + */
es_madre_de(ann,papapa).
/* Relaciones de hermanos */
//Primero suponemos que comparten solo padre y no son la misma persona
es_hermano_de(X,Y) :-
	es_padre_de(Z,X)
	& es_padre_de(Z,Y)
	& es_madre_de(W,X)
	& not es_madre_de(W,Y)
	& not X=Y.
///Segundo suponemos que comparten solo madre y no son la misma persona
es_hermano_de(X,Y) :-
	es_madre_de(Z,X)
	& es_madre_de(Z,Y)
	& es_padre_de(W,X)
	& not es_padre_de(W,Y)
	& not X=Y.
//Tercero suponemos que comparten padre y madre y no son la misma persona
es_hermano_de(X,Y) :- 
	es_padre_de(Z,X)
	& es_padre_de(Z,Y)
	& es_madre_de(W,X)
	& es_madre_de(W,Y)
	& not X=Y.
// Primero reglas para "X es_antepasado_de Y"
es_antepasado_de(X,Y) :- 
	es_padre_de(X,Y).
es_antepasado_de(X,Y) :- 
	es_madre_de(X,Y).
es_antepasado_de(X,Y) :- 
	es_padre_de(X,Z)
	& es_antepasado_de(Z,Y).
es_antepasado_de(X,Y) :- 
	es_madre_de(X,Z)
	& es_antepasado_de(Z,Y).
es_antepasadoIndirecto_de(X,Y) :- 
	es_hermano_de(X,Z)
	& es_antepasado_de(Z,Y).
// Luego reglas para "X es_descendiente_de Y"
es_descendiente_de(X,Y) :- 
	es_padre_de(Y,X).
es_descendiente_de(X,Y) :- 
	es_madre_de(Y,X).
es_descendiente_de(X,Y) :- 
	es_padre_de(Y,Z)
	& es_descendiente_de(X,Z).
es_descendiente_de(X,Y) :- 
	es_madre_de(Y,Z)
	& es_descendiente_de(X,Z).
// Por último las reglas para "X es_pariente_de Y"
es_pariente_de(X,Y) :-
	es_antepasado_de(X,Y)
	& not X=Y.
es_pariente_de(X,Y) :-
	es_antepasadoIndirecto_de(X,Y)
	& not X=Y.
es_pariente_de(X,Y) :-
	es_descendiente_de(X,Y)
	& not X=Y.
// --- ORIGINAL.

// --- EJERCICIO 4.
//Primera Gen
es_primeragen_de(X,Y) :- 
	es_padre_de(Y,X).
es_primeragen_de(X,Y) :- 
	es_madre_de(Y,X).
es_primeragen_de(X,Y) :- 
	es_padre_de(X,Y).
es_primeragen_de(X,Y) :- 
	es_madre_de(X,Y).
es_primeragen_de(X,Y) :- 
	es_padre_de(Z,X)
	& es_padre_de(Z,Y)
	& es_madre_de(W,X)
	& es_madre_de(W,Y)
	& not X=Y.
es_primeragen_de(X,Y) :-
	es_padre_de(Z,X)
	& es_padre_de(Z,Y)
	& es_madre_de(W,X)
	& not es_madre_de(W,Y)
	& not X=Y.
es_primeragen_de(X,Y) :-
	es_madre_de(Z,X)
	& es_madre_de(Z,Y)
	& es_padre_de(W,X)
	& not es_padre_de(W,Y)
	& not X=Y.
//Segunda Gen
es_segundagen_de(X,Y) :- 
	es_padre_de(X,Z)
	& es_padre_de(Z,Y).
es_segundagen_de(X,Y) :- 
	es_madre_de(X,Z)
	& es_padre_de(Z,Y).
es_segundagen_de(X,Y) :- 
	es_padre_de(X,Z)
	& es_madre_de(Z,Y).
es_segundagen_de(X,Y) :- 
	es_madre_de(X,Z)
	& es_madre_de(Z,Y).
es_segundagen_de(X,Y) :- 
	es_hermano_de(X,Z)
	& es_antepasado_de(Z,Y).
//Terceira Gen	
es_terceragen_de(X,Y):-
	es_padre_de(Z,X)
	& es_hermano_de(W,Z)
	& es_descendiente_de(Y,W).
// --- EJERCICIO 4.

// --- INICIO.
!start.
+!start: yo(X) <-
	.findall(Y,es_primeragen_de(Y,X),L);
	.print("Primera Generacion son: ",L);
	.findall(Y,es_segundagen_de(Y,X),Z);
	.print("Segunda Generacion son: ",Z);
	.findall(Y,es_terceragen_de(Y,X),W);
	.print("Tercera Generacion son: ",W).

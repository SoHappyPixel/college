queens(Queens,SOL):-
	create(Queens,Board),
	rotate(Board,SOL),
	check(SOL).

create(0,[]). %Axioma.
create(Queens,[Queens|Tail]):- 
	Less is Queens - 1,
	Less >= 0, 
	create(Less,Tail).

rotate([],[]). %Axioma.
rotate(Board,[Pivot|Rotated]):-
	pivot(Board,Pivot,Pivoted),
	rotate(Pivoted,Rotated).

pivot([Pivot|QueensTail],Pivot,QueensTail). %Axioma.
pivot([FirstQueen|QueensTail],Pivot,[FirstQueen|AlterQueens]):-
	pivot(QueensTail,Pivot,AlterQueens).

check([]). %Axioma.
check([FirstQueen|QueensTail]):-
	not(eat(FirstQueen,QueensTail)),
	check(QueensTail).

eat(_,[]):- fail. %Axioma.
eat(StickyQueen,QueensTail):- %Interfaz
	eat(StickyQueen,1,QueensTail).
eat(StickyQueen,Length,[FirstOfTail|_]):-
	StickyQueen is FirstOfTail+Length; %Ascendente
	StickyQueen is FirstOfTail-Length; %Descendente
	StickyQueen = FirstOfTail. %Columna
eat(StickyQueen,Length,[_|RestOfTail]):- %Incremento diagonal
	Plus is Length + 1,
	eat(StickyQueen,Plus,RestOfTail).

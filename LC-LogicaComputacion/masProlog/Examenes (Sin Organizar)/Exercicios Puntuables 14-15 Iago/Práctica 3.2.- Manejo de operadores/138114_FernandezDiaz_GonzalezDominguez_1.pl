:-op(100,fx,[el]).
:-op(200,xfx,[con]).
:-op(300,xfx,[es]).
:-op(400,fx,[union_de]).
:-op(500,fx,[la]).

miembro(X,[X|_]).
miembro(X,[Car|Cdr]) :- miembro(X,Cdr).

la union_de [] con ListaA es el ListaA. 
la union_de [Car|Cdr] con ListaB es el Union:-miembro(Car,ListaB),la union_de Cdr con ListaB es el Union,!.
la union_de [Car|Cdr] con ListaB es el [Car|Union]:-la union_de Cdr con ListaB es el Union.

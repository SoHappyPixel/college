:-op(600,xfy,[-]).


quicksort([Car|Cdr],Resultado) :- quicksort_dl([Car|Cdr],Resultado-[]).

quicksort_dl([],X-X).
quicksort_dl([Car|Cdr],Z-Y) :- partir(Car,Cdr,Izq,Der),!,
			     	       quicksort_dl(Izq,Z-[Car|X]),
			    	       quicksort_dl(Der,X-Y).

partir(_,[],[],[]).
partir(Pivote,[Car|Cdr],[Car|Izq],Der) :- Car =< Pivote,partir(Pivote,Cdr,Izq,Der).
partir(Pivote,[Car|Cdr],Izq,[Car|Der]) :- Car >  Pivote,partir(Pivote,Cdr,Izq,Der).

/* PROLOG */
parser([[X,Y]|_],X,Y).
bb(Size,Size,Size,[[Size,Size]]).
bb(It,It,Size,[[It,It]|L]):- N_val = It+1 & bb(N_val,It,Size,L).
bb(Size,It,Size,[[Size,It]|L]):- N_it = It+1 & bb(0,N_it,Size,L).
bb(Val,It,Size,[[Val,It]|L]):- N_val = Val+1 & bb(N_val,It,Size,L).


/* JASON */
!start.
+!start: true <-
	?size(ES); ?bb(0,0,ES-1,BB);
	+fullBoard(BB); +player(0).

+player(0) <- !do(0); .abolish(player(_)); .wait({+player(0)}).

+queen(X,Y) <-
	?size(ES); S=ES-1;  
	I=0;
	while(I < S)
	{
		if(not(I == X)) { +tp(I,Y) }
		if(not(I == Y))
		{
			+tp(X,I);
			if((0 <= X-I+Y) & (GSize > X-I+Y))
			{ Col = X-I+Y; +tp(Col,I); }
			if((GSize > X+I-Y) & (0 <= X+I-Y))  
			{ Col= X+I-Y; +tp(Col,I); }
		}                                             
		I=I+1;                     
	}. 
                                        
+!do(P) <-  
	.print("Jugando: ", P); ?fullBoard(FB);
	.findall([A,O],tp(A,O),TP); .print("TP: ", TP);
	.difference(FB,TP,FP); .print("FP: ", FP);
	if(not(.empty(FP)))
	{
		.shuffle(FP,SFP);
		?parser(SFP,X,Y);
		move_towards(X,Y);
		put(queen);
		.wait(100000)             
	}
	else { .print("FIN."); .kill_agent(r0); .kill_agent(r1); }.

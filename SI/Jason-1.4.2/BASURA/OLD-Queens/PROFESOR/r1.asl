/* PROLOG */
iterator(Y,Y,L,R):- lookfor(Y,Y,L,R,Y).
iterator(X,Y,L,K):- X1=X+1 & link(MF,R,K) & lookfor(X,Y,L,MF,Y) & iterator(X1,Y,L,R).

link([], Cs, Cs).
link([A|As],Bs,[A|Cs]):- link(As, Bs, Cs).

lookfor(X,0,L,[],S):- threat([X,0],L,S).
lookfor(X,0,_,[[X,0]],_).
lookfor(X,Y,L,MF,S):- Y1=Y-1 & threat([X,Y],L,S) & lookfor(X,Y1,L,MF,S).
lookfor(X,Y,L,[[X,Y]|MF],S):- Y1=Y-1 & lookfor(X,Y1,L,MF,S).

threat([],[],_).
threat([X,_],[[X,_]|_],_).
threat([_,Y],[[_,Y]|_],_).
threat(Q,[Car|Cdr],P):- threat(Q,Cdr,P) | checkloop(Q,P,[Car|Cdr]).

checkloop([X1,X2],P,[[C1,C2]|R]):- check(X1,X2,P,[[C1,C2]|R])| onemore([X1,X2],P,[[C1,C2]|R]).
onemore([X1,X2],P,[[C1,C2]|R]):- P>0 & P1=P-1 & checkloop([X1,X2],P1,[[C1,C2]|R]).
check(X1,X2,P,[[C1,C2]|R]):- X1=C1+P & X2=C2+P | X1=C1-P & X2=C2+P | X1=C1+P & X2=C2-P | X1=C1-P & X2=C2-P | X1==C1 & X2==C2.

parser([[X,Y]|_],X,Y).


/* JASON */
+player(1) <- !do(1); .abolish(player(_)); .wait(3600000360000036000003600000).

+!do(P) <-
	.print("Jugando: ", P);
	?size(ES); S=ES-1;
	.findall([A,O],queen(A,O),BB);
	.print("BB: ", BB);
	?iterator(0,S,BB,FP);
	.print("FP: ", FP);
	if(not(.empty(FP)))
	{
		.shuffle(FP,SFP);
		?parser(SFP,X,Y);
		move_towards(X,Y);
		put(queen);
	}
	else { .print("FIN."); .kill_agent(r0); .kill_agent(r1);}.

/* PROLOG */
parser([[X,Y]|_],X,Y).
link([], Cs, Cs).
link([A|As],Bs,[A|Cs]):- link(As, Bs, Cs).
iterator(Y,Y,L,R):- lookfor(Y,Y,L,R,Y).
iterator(X,Y,L,K):- X1=X+1 & link(MF,R,K) & lookfor(X,Y,L,MF,Y) & iterator(X1,Y,L,R).
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


/* JASON */
+player(P) : playAs(P) <- !do.

+!do : true <-
  	!getPos(X,Y); //Encontrará una posición libre para colocar un elemento.
	!check(X,Y). //Forzará una comprobación en el instante previo a colocar.

+!check(X,Y)<-
 	if(block(X,Y) | queen(X,Y)) //Si la posición ha sido ocupada...
    { !do } //Repito el proceso.
	else //Si en el instante anterior a colocar, la posicioón sigue libre
    { queen(X,Y) }. //Coloco una reina. (Ó un bloque en el caso del Bloqueador)
	
+!getPos(X,Y) <-
	?size(ES); S=ES-1; //Tamaño del tablero con el que vamos trabajar.
	.findall([I,J],queen(I,J),ALL); //Recoge todas las reinas colocadas.
	?iterator(0,S,ALL,FL); //Calcula las posiciones no amenazadas.
	.findall([N,M],block(N,M),BL); //Recoge todas las casillas bloqueadas.
	.difference(FL,BL,RL); //Calcula libres en base a amenazas y bloqueos.
	if(not(.empty(RL))) //Si hay casillas libres...
    {
      .shuffle(RL,SRL); //Desordenamos la lista de casillas libres.
      ?parser(SRL,X,Y); //Escogemos el primer par de la lista.
    }
	else //Si no hay casillas libres...
    {
      .my_name(ME); //Obtenemos el nombre del agente.
      .kill_agent(ME); //Finalizamos su ejecución.
    }.

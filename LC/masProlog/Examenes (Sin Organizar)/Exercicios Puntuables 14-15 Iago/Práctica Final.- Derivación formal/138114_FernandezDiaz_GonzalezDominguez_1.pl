%'x' es un valor fijo y no una variable.

%clausula   
derivar(U, X, DerU) :- derivada(U, X, D), simplificar(D, DR), signo(DR, DerU).

% (1) Derivada de una constante
derivada(K, X, 0) :- atomic(K), K\==X.


% (2) Derivada de X
derivada(X, X, 1).

% (3) Derivada de un producto
derivada(K*X, X, K):- atomic(K), K\==X.

% (4) Derivada de una exponencial
derivada(X ^ N, X, N * X ^ NN) :- N > 0, NN is N-1, !.
derivada(K * X ^ N, X, K * N * (X ^ NN)) :- N > 0, NN is N-1, !. % derivar(3*5*x^2, x, Derivada).

% (5) Derivada de un logaritmo neperiano
%derivada(ln(A),X,(DerA)/A) :- derivada(A,X,DerA). % derivar(ln(2*x), x, Derivada).

% (6) Derivada de una suma y de una resta
derivada(F + G, X, DerF + DerG) :- derivada(F, X, DerF), derivada(G, X, DerG), !.
derivada(F - G, X, DerF - DerG) :- derivada(F, X, DerF), derivada(G, X, DerG), !.

% (7) Derivada producto de funciones
derivada(F * G, X, F * DerG + G * DerF) :- derivada(F, X, DerF), derivada(G, X, DerG).

% (8) Derivada cociente de funciones
derivada(F / G, X, (F * DerG - G * DerF) / G * G) :- F \== 1, derivada(F, X, DerF), derivada(G, X, DerG).

% (9)

% (10) Derivada de un logaritmo en base a de X
derivada(log(A,X),X,log(A,e)/X).

% (11) Derivada de una constante elevado a X
derivada(K^X,X,K^X/ln(K)) :- atomic(K), K\==X.

% (12) Derivada de una constante elevado a una funcion  % derivar(a^(2*x),x, Derivada).

derivada(K^F,X,K^F*ln(K)*DerF) :- derivada(F,X,DerF).

% (13) Derivada de una constante por una funcion
derivada(K*F,X,K*DerF) :- derivada(F,X,DerF),atomic(K), K\==X.

% (14) Derivada de el numero e elevado a x
derivada('e'^A,X,'e'^A).  % revisar

% (15) Derivada de una raiz cuadrada
derivada(sqrt(F),X,DerF/2*sqrt(F)):-derivada(F,X,DerF).

% (16)

% (17)

% (18)

% (19)
derivada(sin(X), X, cos(X)) :- !.

% (20)
derivada(cos(X), X, -sin(X)) :- !.

% (21) Derivada de la tangente de una funcion
derivada(tg(F),X,DerF/cos(F)*cos(F)) :- derivada(F,X,DerF).

% (22) Derivada de una cotangente de una funcion
derivada(cotg(F),X,-(DerF)/sin(F)*sin(F)) :- derivada(F,X,DerF).

% (23) Derivada de la secante de una funcion
derivada(sec(F),X,(DerF*sin(F))/cos(F)*cos(F)) :- derivada(F,X,DerF).

% (24) Derivada de la cosecante de una funcion
derivada(cosec(F),X,-((DerF*cos(F))/sin(F)*sin(F))) :- derivada(F,X,DerF).

% (25)
derivada(sin(F), X, DerF * cos(F)) :- derivada(F, X, DerF), !.

% (26)
derivada(cos(F), X, DerF * -sin(F)) :- derivada(F, X, DerF), !.

% (27) Derivada de logaritmo neperiano de una funcion
derivada(ln(A),X,(DerA)/A) :- derivada(A,X,DerA). % derivar(ln(2*x), x, Derivada).

% (28) Derivada de arcoseno de una funcion
derivada(arcsin(F), X, DerF/(sqrt(1-F^2))) :- derivada(F, X, DerF), !.

% (29) Derivada de arcocoseno de una funcion
derivada(arccos(F), X, -(DerF/(sqrt(1-F^2)))) :- derivada(F, X, DerF), !.

% (30) Derivada de logaritmo neperiano de una funcion
derivada(arctg(F), X, DerF/(1+F^2)) :- derivada(F, X, DerF), !.









%operaciones basicas
operacion(A + B, R) :- number(A), number(B), !, R is A + B.
operacion(A - B, R) :- number(A), number(B), !, C is -B, operacion(A + C, R).

operacion(0 + A, A) :- !.
operacion(A + 0, A) :- !.
operacion(A - 0, A) :- !.
operacion(0 - A, -A) :- !.
operacion(A - A, 0) :- !.

operacion(A * B, C) :- number(A), number(B), !, C is A * B.
operacion(A * B, C) :- number(A), number(B), !, C is A * B.

operacion(1 * A, A) :- !.
operacion(A * 1, A) :- !.
operacion(0 * A, 0) :- atomic(A), !.
operacion(A * 0, 0) :- atomic(A), !.




operacion(0 * sin(_), 0) :- !.
operacion(sin(_) * 0, 0) :- !.
operacion(0 * cos(_), 0) :- !.
operacion(cos(_) * 0, 0) :- !.
operacion(1 ^ _, 1) :- !.
operacion(_ ^ 0, 1) :- !.
operacion(Num ^ 1, Num) :- !.
operacion(0 ^ _, 0) :- !.
operacion(Base ^ Exp, R) :- number(Base), number(Exp), !, exponencial(Base,Exp,R).

operacion(A, A).


exponencial(_, 0, 0) :-!.
exponencial(Base, 1, Base) :-!.
exponencial(Base, Exp, R) :- Exp1 is Exp-1, exponencial(Base, Exp1, R1), R is Base*R1.



%simplificar de expresiones
simplificar(A + B, R) :- !, simplificar(A, A1), simplificar(B, B1), operacion(A1 + B1, R).
simplificar(A - B, R) :- !, simplificar(A, A1), simplificar(B, B1), operacion(A1 - B1, R).
simplificar(A * B, R) :- !, simplificar(A, A1), simplificar(B, B1), operacion(A1 * B1, R).
simplificar(A / B, R) :- !, simplificar(A, A1), simplificar(B, B1), operacion(A1 / B1, R).
simplificar(A ^ B, R) :- !, simplificar(A, A1), simplificar(B, B1), operacion(A1 ^ B1, R).
simplificar(A, A).

%Convenio de signos
signo(-(-A), A).
signo(-(A + B), -A - B).
signo(-(A - B), -A + B).
signo(A, A).


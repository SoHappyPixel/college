nreinas(N,Sol):- generarTablero(N,Tablero), permutar(Tablero,Sol), buenTablero(Sol).

% Crea un tablero base [n,n-1,...,1].
generarTablero(0,[]).
generarTablero(X,[X|R]):- XMenos1 is X - 1, XMenos1 >= 0, generarTablero(XMenos1,R).

% Permuta la lista (tablero) en base al pivote
% (e.g: [4,3,2,1] -> [4,3,1,2] falla. -> [4,2,3,1]...).
permutar([],[]).
permutar(X,[C|Z]):- seleccionar(X,C,R), permutar(R,Z).

% Pivote y intercambio de pivote.
seleccionar([X|R],X,R).
seleccionar([C|R],X,[C|Y]):- seleccionar(R,X,Y).

% Checkea de reina a reina que no se amenacen. (El ; es un OR)
buenTablero([]).
buenTablero([C|R]):- not(amenaza(C,R)), buenTablero(R).

% (Variar el codigo ya que la referencia de la amenaza es la C no la X)
amenaza(X,Prof,[C|_]):- X is C+Prof; X is C-Prof; X = C. %Compruebo ascendente descendente y columna.
amenaza(X,Prof,[_|R]):- ProfMas1 is Prof + 1, amenaza(X,ProfMas1,R). %Avanzo diagonal
amenaza(_,[]):- fail. %Parada (SOLUCION CORRECTA)
amenaza(X,Y):- amenaza(X,1,Y). %interfaz

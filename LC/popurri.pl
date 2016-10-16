%%-----------------------------------------------------%%
/* ANALISIS SINTÁCTICO */
    
    %FRASE 1
        % analizame(AS,[el,conejo,es,un,animal,pequenho,suave,y,miedoso]).
        % analizame(AS,[cuando,ve,algo,raro,corre,a,esconderse,en,su,madriguera]).
        analizame(Arbol,Frase):- o(Arbol,Frase-[]),!.

        %~ SINTAXIS.
        o(o(SN,SV,SN2),P0-P3):- sNom(SN,Num,Gen,P0-P1),sVerb(SV,Num,P1-P2),sNom(SN2,Num,Gen,P2-P3).
        o(o(SV,SV2),P0-P2):- sVerb(SV,_,P0-P1),sVerb(SV2,_,P1-P2).

        sPrep(sPrep(Prep,SN),P0-P2):- prep(Prep,P0-P1),sNom(SN,_,_,P1-P2).
        sAdv(sAdv(Adv,SN),P0-P2):- adv(Adv,Num,Gen,P0-P1), sNom(SN,Num,Gen,P1-P2).
        sAdj(sAdj(Adj,Adj2,Conj,Adj3),Num,Gen,P0-P4):- adj(Adj,Num,Gen,P0-P1),adj(Adj2,Num,Gen,P1-P2),conj(Conj,P2-P3),adj(Adj3,Num,Gen,P3-P4).

        sNom(sNom(nil),_,_,P0-P0).
        sNom(sNom(Det,N,SAdj),Num,Gen,P0-P3):- det(Det,Num,Gen,P0-P1),nom(N,Num,Gen,P1-P2),sAdj(SAdj,Num,Gen,P2-P3).
        sNom(sNom(Det,N),Num,Gen,P0-P2):- det(Det,Num,Gen,P0-P1), nom(N,Num,Gen,P1-P2).
        sNom(sNom(N),Num,Gen,P0-P1):- nom(N,Num,Gen,P0-P1).
        sNom(sNom(N,Adj),Num,Gen,P0-P2):- nom(N,Num,Gen,P0-P1), adj(Adj,Num,Gen,P1-P2).

        sVerb(sVerb(nil),_,P0-P0).
        sVerb(sVerb(V),Num,P0-P1):- verb(V,Num,P0-P1).
        sVerb(sVerb(Adv,V,SN),Num,P0-P3):- adv(Adv,_,_,P0-P1),verb(V,Num,P1-P2),sNom(SN,_,_,P2-P3).
        sVerb(sVerb(V,Prep,V2,SP),Num,P0-P4):- verb(V,Num,P0-P1),prep(Prep,P1-P2),verb(V2,_,P2-P3),sPrep(SP,P3-P4).

        %~ DICCIONARIO.
        det(su,sing,_,[su|X]-X).
        det(el,sing,masc,[el|X]-X).
        det(un,sing,masc,[un|X]-X).
        nom(algo,sing,_,[algo|X]-X).
        nom(conejo,sing,masc,[conejo|X]-X).
        nom(animal,sing,masc,[animal|X]-X).
        nom(madriguera,sing,fem,[madriguera|X]-X).
        verb(es,sing,[es|X]-X).
        verb(ve,sing,[ve|X]-X).
        verb(corre,sing,[corre|X]-X).
        verb(esconderse,sing,[esconderse|X]-X).
        prep(a,[a|X]-X).
        prep(en,[en|X]-X).
        conj(y,[y|X]-X).
        adv(cuando,_,_,[cuando|X]-X).
        adj(pequenho,sing,masc,[pequenho|X]-X).
        adj(suave,sing,_,[suave|X]-X).
        adj(miedoso,sing,masc,[miedoso|X]-X).
        adj(raro,sing,masc,[raro|X]-X).

    %FRASE 2
        analizameEsta(Arbol,Frase):- o(Arbol,Frase-[]),!.

        %~ SINTAXIS.
        o((SN,SV,Conj,SN2,SV2),P0-P5):- sNom(SN,Num1,_,P0-P1), sVerb(SV,Num1,P1-P2), conj(Conj,P2-P3), sNom(SN2,Num2,_,P3-P4), sVerb(SV2,Num2,P4-P5).
        sAdv(sAdv(Adv,SN),P0-P2):- adv(Adv,Num,Gen,P0-P1), sNom(SN,Num,Gen,P1-P2).

        sNom(sNom(nil),_,_,P0-P0).
        sNom(sNom(Det,N,Adv,Adj),Num,Gen,P0-P4):- det(Det,Num,Gen,P0-P1), n(N,Num,Gen,P1-P2),adv(Adv,Num,Gen,P2-P3), adj(Adj,Num,Gen,P3-P4).
        sNom(sNom(Det,N),Num,Gen,P0-P2):- det(Det,Num,Gen,P0-P1), n(N,Num,Gen,P1-P2).
        sNom(sNom(N),Num,Gen,P0-P1):- n(N,Num,Gen,P0-P1).

        sVerb(sVerb(nil),_,P0-P0).
        sVerb(sVerb(V),Num,P0-P1):- verb(V,Num,P0-P1).
        sVerb(sVerb(V,SN),Num,P0-P2):- verb(V,Num,P0-P1), sNom(SN,_,_,P1-P2).
        sVerb(sVerb(V,SAdv),Num,P0-P2):- verb(V,Num,P0-P1), sAdv(SAdv,P1-P2).

        %~ DICCIONARIO.
        conj(y,[y|X]-X).
        verb(apaga,sing,[apaga|X]-X).
        verb(prepara,sing,[prepara|X]-X).
        adv(muy,_,_,[muy|X]-X).
        adv(todas,plu,fem,[todas|X]-X).
        adj(grande,sing,_,[grande|X]-X).
        det(su,sing,_,[su|X]-X).
        det(las,plu,fem,[las|X]-X).
        det(una,sing,fem,[una|X]-X).
        n(mama,sing,fem,[mama|X]-X).
        n(marta,sing,fem,[marta|X]-X).
        n(tarta,sing,fem,[tarta|X]-X).
        n(velitas,plu,fem,[velitas|X]-X).
%%-----------------------------------------------------%%
%%-----------------------------------------------------%%
/* DIFERENCIAS DE LISTAS */
    l2dl([],L-L).
    l2dl([Car|Cdr],[Car|R]-X) :- l2dl(Cdr,R-X).

    dl2l(X-X,[]).
    dl2l([Car|Cdr]-X, [Car|R]):- dl2l(Cdr-X,R).

    idl_QuickSort(L,R):- dl_QuickSort(L,R-[]).
    dl_QuickSort([],L-L).
    dl_QuickSort([Car|Cdr], OrdInf-X):- ord_Split(Car,Cdr,Inf,Sup),
                                        dl_QuickSort(Inf, OrdInf-[Car|OrdSup]),
                                        dl_QuickSort(Sup, OrdSup-X),!.

    dl_Line([],_,X-X):- !.
    dl_Line([Car|Cdr],Elem,R-X):- dl_Line(Cdr,Elem,R-[(Car,Elem)|X]).

    idl_Cartesian(L,E,R):- dl_Cartesian(L,E,R-[]).
    dl_Cartesian([],_,X-X):- !.
    dl_Cartesian([Car|Cdr],L,R-A):- dl_Line(L,Car,R-X), dl_Cartesian(Cdr,L,X-A).

    idl_Reverse(L,R):- dl_Reverse(L,R-[]).
    dl_Reverse([],X-X):- !.
    dl_Reverse([Car|Cdr],R-X):- dl_Reverse(Cdr,R-[Car|X]).

    idl_Rotar(L,R):- dl_Rotar(L,R-[]).
    dl_Rotar([],X-X):- !.
    dl_Rotar(L, R-X):- l2dl(L,[Car|Cdr]-[]), l2dl(Cdr,R-[Car|X]).
%%-----------------------------------------------------%%
%%-----------------------------------------------------%%
/* OPERADORES LÉXICOS */

    %Explicacionn xfx, yfx, fx, xf... FROM: http://www.lix.polytechnique.fr/~catuscia/teaching/prolog/Manual/sec-3.21.html
    %% The `f' indicates the position of the functor, while x and y indicate the position of the arguments.
    %% * 'y' means: on this position a term with precedence lower or equal to the precedence of the functor should occur".
    %% * 'x' means: the precedence of the argument must be strictly lower.

    %UnionConjuntos. RESPONDE A: Resultado es la union del conjunto [1,2,3] con [4,5,6] con [7,8,9] sin duda.
        :- op(100,yfx,con).
        :- op(200,fx,conjunto).
        :- op(300,fx,del).
        :- op(400,fx,union).
        :- op(500,fx,la).
        :- op(600,xfx,es).
        :- op(700,xf,sin).
        :- op(800,xf,duda).
        (Resultado es la union del conjunto Primero con Segundo con Tercero sin duda):-
        c_Union(Primero,Segundo,Parcial), c_Union(Parcial,Tercero,Resultado).
    %EscalarListas. RESPONDE A: Resultado se halla mediante el escalar de [1,2,3] y [4,5,6] seguramente.
        :- op(100,yfx,y).
        :- op(200,fx,de).
        :- op(300,fx,escalar).
        :- op(400,fx,el).
        :- op(500,fx,mediante).
        :- op(600,fx,halla).
        :- op(700,xfx,se).
        :- op(800,xf,seguramente).
        (Resultado se halla mediante el escalar de Primera y Segunda seguramente):-
        acl_Scalar(Primera,Segunda,Resultado).
    %BorrarValor. RESPONDE A: Roman y Diego y Rui estan jugando ha ganado Diego pero LosDemas se han divertido.
        :- op(100,xfy,pero).
        :- op(150,yfx,y).
        :- op(300,fx,ganado).
        :- op(350,fx,ha).
        :- op(400,fx,jugando).
        :- op(450,xfx,estan).
        :- op(650,xf,se).
        :- op(700,xf,han).
        :- op(750,xf,divertido).
        (N1 y N2 y N3 estan jugando ha ganado Alguien pero Los_Demas se han divertido):-
        li_DelVal(Alguien,[N1,N2,N3],Los_Demas).
%%-----------------------------------------------------%%
%%-----------------------------------------------------%%
/* CONCEPTOS BASICOS */
    g_IfElse(A,B,_):- A,!,B.
    g_IfElse(_,_,Rr):- Rr.
    /*ARITMÉTICA*/
        n_Par(0).
        n_Par(s(A)):- n_Par(A).

        n_Impar(1).
        n_Impar(s(A)):- n_Impar(A).

        n_Natural(0).
        n_Natural(s(A)):- n_Natural(A).

        n_Suma(0,_,_).
        n_Suma(s(A),B,s(C)):- n_Suma(A,B,C).

        n_Producto(0,_,0).
        n_Producto(s(A),B,Rr):- n_Producto(A,B,Ppr), n_Suma(B,Ppr,Rr).

        n_Potentcia(_,0,s(0)).
        n_Potencia(A,s(B),Rr):- n_Potencia(A,B,Ppo), n_Producto(A,Ppo,Rr).

        n_Mod(D,Dd,D):- D<Dd, !.
        n_Mod(D,Dd,Rr):- P is D-Dd, n_Mod(P,Dd,Rr).        
    /*LISTAS*/
        li_IsList([]).
        li_IsList([_|Cdr]):- li_IsList(Cdr).

        li_IsMember(A, [A|_]):-!.
        li_IsMember(A,[_|Cdr]):- li_IsMember(A,Cdr).

        li_Length([],0).
        li_Length([_|Cdr],A):- li_Length(Cdr,B), A is B+1.

        li_Last(_,_).
        li_Last([_|Cdr],A):- li_Last(Cdr,A).

        li_EqualsD([],[]).
        li_EqualsD([Car|Cdr],[Car|Cdr]).

        li_EqualsR([],[]).
        li_EqualsR([Car|Cdr_1],[Car|Cdr_2]):- li_EqualsR(Cdr_1,Cdr_2).

        li_Concat([],_,[]).
        li_Concat([Car|Cdr],E,[Car|R]):- li_Concat(Cdr,E,R).

        li_Reverse([],[]).
        li_Reverse([Car|Cdr],Rr):- li_Reverse(Cdr,A), li_Concat(A,[Car],Rr).

        li_AddZero([],[]).
        li_AddZero([Car|Cdr],[Car,0|Rr]):- li_AddZero(Cdr,Rr).

        li_Add(X,[],[X|_]).
        li_Add(A,[Car|Cdr],[A|[Car|Cdr]]).

        li_GetPenul([],[]).
        li_GetPenul([X._],X):- !.
        li_GetPenul([_|Cdr],R):- li_GetPenul(Cdr,R).

        li_GetV(_,[],[]).
        li_GetV(A,[[A|_]|Cdr],Cdr).
        li_GetV(A,[[_|_]|Cdr],Rr):- li_GetV(A,Cdr,Rr).

        li_DelPos(_,[],[]).
        li_DelPos(1,[_|Cdr],Cdr).
        li_DelPos(A,[Car|Cdr],[Car,Rr]):- NewA is A-1, li_DelPos(NewA,Cdr,Rr).

        li_DelVal(_,[],[]).
        li_DelVal(A,[Car|Cdr],Cdr):- A == Car,!.
        li_DelVal(A,[Car|Cdr],[Car|Rr]):- li_DelVal(A,Cdr,Rr), !.

        li_GetHead([],_).
        li_GetHead([Car|_],Car).
        li_DelUnique([],[]).
        li_DelUnique([Car|Cdr],[Car|Rr]):- li_GetHead(Cdr,Pgh),Car=Pgh,!,li_DelUnique(Cdr,Rr).
        li_DelUnique([_|Cdr],Rr):- li_DelUnique(Cdr,Rr).

        li_RangePos([],_,_,[]).
        li_RangePos([_|_],1,1,[]):- !.
        li_RangePos([Car|Cdr],1,B,[Car|Rr]):- NewB is B-1, li_RangePos(Cdr,1,NewB,Rr), !.
        li_RangePos([_|Cdr],A,B,Rr):- NewA is A-1, li_RangePos(Cdr,NewA,B,Rr).

        li_RangeVal([],_,_,[]).
        li_RangeVal([A,B],A,B,[]):- !.
        li_RangeVal([A|Cdr],A,B,[A|R]):- li_RangeVal(Cdr,B,R),!.
        li_RangeVal([_|Cdr],A,B,R):- li_RangeVal(Cdr,A,B,R).
        li_RangeVal([B|_],B,B):- !.
        li_RangeVal([Car|Cdr],B,[Car|R]):- li_RangeVal(Cdr,B,R).
    /*CONJUNTOS*/ 
        c_IsConj([]).
        c_IsConj([Car|Cdr]):- li_IsMember(Car,Cdr), !, fail.
        c_IsConj([_|Cdr]):- c_IsConj(Cdr).

        c_IsSubConj([],_).
        c_IsSubConj([Car|Cdr],A):- li_IsMember(Car,A), c_IsSubConj(Cdr,A).

        c_Equals(A,B):- c_IsSubConj(A,B), c_IsSubConj(B,A).

        c_Union([],[_|_],[_|_]).
        c_Union([Car|Cdr],A,Rr):- li_IsMember(Car,A),!,c_Union(Cdr,A,Rr).
        c_Union([Car|Cdr],A,[Car|Rr]):- c_Union(Cdr,A,Rr).

        c_Inter([],[_|_],[]).
        c_Inter([Car|Cdr],A,[Car|Rr]):- li_IsMember(Car,A),!,c_Inter(Cdr,A,Rr).
        c_Inter([_|Cdr],A,Rr):- c_Inter(Cdr,A,Rr).

        c_Complement(_,[],[]).
        c_Complement(A,[Car|Cdr],Rr):- li_IsMember(Car,A),!,c_Complement(A,Cdr,Rr).
        c_Complement(A,[_|Cdr],Rr):- c_Complement(A,Cdr,Rr).
    /*ARITMÉTICA DE CONJUNTOS Y LISTAS.*/
        acl_Line(_,[],[]).
        acl_Line(A,[Car|Cdr],[par(A,Car)|Rr]):- acl_Line(A,Cdr,Rr).

        acl_Cartesian([],_,[]).
        acl_Cartesian([],[],[]).
        acl_Cartesian([Car|Cdr],A,Rr):- acl_Cartesian(Cdr,A,Pc), acl_Line(Car,A,Pl), li_Concat(Pl,Pc,Rr).

        acl_Scalar(_,_,0).
        acl_Scalar([Car_1|Cdr_1],[Car_2|Cdr_2],Rr):- acl_Scalar(Cdr_1,Cdr_2,Pe), Rr is Car_1*Car_2+Pe.
    /*ORDENACIÓN*/
        ord_Split(_,[],[],[]).
        ord_Split(A,[Car|Cdr],[Car|InfEq],Sup):- A>=Car,!,ord_Split(A,Cdr,InfEq,Sup).
        ord_Split(A,[Car|Cdr],InfEq,[Car|Sup]):- ord_Split(A,Cdr,InfEq,Sup).

        ord_QuickSort([],[]).
        ord_Quicksort([Car|Cdr], Rr) :- ord_Split(Car,Cdr,Inf,Sup),
                                        ord_Quicksort(Inf, OrdInf),
                                        ord_Quicksort(Sup, OrdSup),
                                        li_Concat(OrdInf,[Car|OrdSup],Rr).
%%-----------------------------------------------------%%
%%-----------------------------------------------------%%
/* ANOTACIONES VARIAS */
    %Un Conjunto es una Lista sin repeticiones.

    % ÁRBOLES RESOLUCIÓN (Recorrido y Variables):
        % ·RECORRIDO en ANCHURA, renombradas por Rama. (Más memoria)
        % ·RECORRIDO en PROFUNDIDAD,  renombadas por Nivel. (Menos memoriºa)

    %CORTES:
        %(Verde): !,Efecto. ó !.
        %(Rojo): Condición,!,Efecto. ó Condición,!,fail.

    %quickSort(). %PAG21: Inferiores + PIVOTE + Superiores. Recursivdad sobre I y S.
%%-----------------------------------------------------%%
%%-----------------------------------------------------%%
/* EXAMENES */
    /* EXAMEN PRACTICO -UNO- */
        % ultimo([a,a,b,a,b,a,c,c,d],X). es X = d
        % ultimo([],X). False
        ex_ultimo([],_):- !,fail.
        ex_ultimo([E],E):- !.
        ex_ultimo([_,E],E):- !.
        ex_ultimo([_|Cdr],R):- ex_ultimo(Cdr,R).

        % partir([a,b,c,d,e,f,g], 3, X, Y)
        % es X=[a,b,c] e Y=[d,e,f,g]
        ex_partir([],_,[],[]).
        ex_partir([Car|Cdr],1,[Car],Cdr):- !.
        ex_partir([Car|Cdr],Pos,[Car|Izq],Der):- NewPos is Pos-1, ex_partir(Cdr,NewPos,Izq,Der).
    
    /* EXAMEN PRACTICO -DOS- */
        %%el producto cartesiano de [1,2] por [a] por [3,4] es X definitivamente.
        :- op(100,xfy,por).
        :- op(200,fx,de).
        :- op(300,fx,cartesiano).
        :- op(400,fx,producto).
        :- op(500,fx,el).
        :- op(600,xfx,es).
        :- op(700,xf,definitivamente).

        (el producto cartesiano de Conj_1 por Conj_2 por Conj_3 es Resultado definitivamente):-
        ex_cartesiano(Conj_2,Conj_3,Parcial), ex_cartesiano(Conj_1,Parcial,Resultado).

        ex_concatenar([],X,X).
        ex_concatenar([Car|Cdr],E,[Car|R]):- ex_concatenar(Cdr,E,R).
        ex_linea(_,[],[]).
        ex_linea(A,[Car|Cdr],[[A,Car]|Rr]):- ex_linea(A,Cdr,Rr).
        ex_cartesiano([],[_|_],[]).
        ex_cartesiano([],[],[]).
        ex_cartesiano([Car|Cdr],A,Rr):- ex_linea(Car,A,Pl),
                                        ex_cartesiano(Cdr,A,Pc), 
                                        ex_concatenar(Pl,Pc,Rr), !.

	/* EXAMEN PRACTICO -TRES- */
		dlPref(Pre,Cad):- 
            name(Pre,P),
            name(Cad,C),
            l2dl(P,Comun-_),
            l2dl(C,Comun-_).
%%-----------------------------------------------------%%

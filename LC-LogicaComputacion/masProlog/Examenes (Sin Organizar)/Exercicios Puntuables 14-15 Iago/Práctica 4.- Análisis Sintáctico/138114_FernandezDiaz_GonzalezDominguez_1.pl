%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                                   LOS MISERABLES de Victor HUGO
%
%   La dicha suprema de la vida es la convicción de que somos amados(1), amados por nosotros mismos(2);
%   mejor dicho amados a pesar de nosotros(3); esta convicción la tiene el ciego(4).
%   ¿Le falta algo(5)? No(6), teniendo amor no se pierde la luz(7).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% frase 1
    % ?- frase(Arbol,[la,dicha,suprema,de,la,vida,es,la,conviccion,'de que',somos,amados]).
% frase 2
    % ?- frase(Arbol,[amados,por,nosotros,mismos]).
% frase 3
    % ?- frase(Arbol,[mejor,dicho,amados,a,pesar,de,nosotros]).
% frase 4
    % ?- frase(Arbol,[esta,conviccion,la,tiene,el,ciego]).
% frase 5
    % ?- frase(Arbol,[le,falta,algo]).
% frase 6
    % ?- frase(Arbol,[no]).
% frase 7
    % ?- frase(Arbol,[teniendo,amor,no,se,pierde,la,luz]).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DCG para un subconjunto del español (picoSpanish)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Definicion del operador de diferencias de listas

:-op(600,xfy,[\]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base de datos intensiva (sintaxis).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clausula de interfaz para pasar de listas a diferencias de listas

frase(Arbol,Frase) :- frase_dl(Arbol,Frase\[]).


% Estructura de la frase

frase_dl(f(SV,SN),P0\P2):- sv(SV,Num,P0\P1),sn(SN,Num,P1\P2).
frase_dl(f(SN,SV),P0\P2):- sn(SN,Num,P0\P1),sv(SV,Num,P1\P2).


% Estructura de un sintagma nominal

    % sintagma nominal frase 2, frase 3, frase 6.
        sn(sn(nil),_,P0\P0).
    % sintagma nominal frase 1
        sn(sn(N,CN),Num,P0\P2):-nucleo(N,Num,_,P0\P1),compnombre(CN,P1\P2).
    % sintagma nominal frase 4, frase 7
        sn(sn(Det,N),Num,P0\P2):-det(Det,Num,Gen,P0\P1),nucleo(N,Num,Gen,P1\P2).
    % sintagma nominal frase 5
        sn(sn(N),Num,P0\P1):-nucleo(N,Num,_,P0\P1).

    % sn(sn(Det,N,Adj),Num,P0\P3):-det(Det,Num,Gen,P0\P1),n(N,Num,Gen,P1\P2),adj(Adj,Num,Gen,P2\P3).


% Estructura de un sintagma verbal

    % sintagma verbal frase 6
        sv(sv(V),_,P0\P1):-adverbio(V,P0\P1).
    % sintagma verbal frase 1
        sv(sv(V,A,P),Num,P0\P3):-nucleo(V,Num,P0\P1),atributo(A,P1\P2),propsubadj(P,P2\P3).
    % sintagma verbal frase 2
        sv(sv(V,A),Num,P0\P2):-nucleo(V,Num,P0\P1),compagente(A,P1\P2).
    % sintagma verbal frase 3
        sv(sv(In,V,CC),Num,P0\P3):-interjeccion(In,P0\P1),nucleo(V,Num,P1\P2),compcircunstancial(CC,P2\P3).
    % sintagma verbal frase 4
        sv(sv(Pr,Ar,V),Num,P0\P3):-compdir(Pr,P0\P1),compdir(Ar,P1\P2),nucleo(V,Num,P2\P3).
    % sintagma verbal frase 5
        sv(sv(Pr,V),Num,P0\P2):-compindir(Pr,P0\P1),nucleo(V,Num,P1\P2).
    % sintagma verbal frase 7
        sv(sv(Cp,Ad,Pr,V),Num,P0\P4):-comppredicativo(Cp,P0\P1),adverbio(Ad,P1\P2),pr_reflexivo(Pr,Num,P2\P3),nucleo(V,Num,P3\P4).

    % sv(sv(V),Num,P0\P1):-v(V,Num,P0\P1).
    % sv(sv(nil),_,P0\P0).
    % sv(sv(V,SN),Num,P0\P2):-v(V,Num,P0\P1),sn(SN,_,P1\P2).
    % sv(sv(V,SPREP),Num,P0\P2):-v(V,Num,P0\P1),sprep(SPREP,P1\P2).
    % sv(sv(V,SN,SPREP),Num,P0\P3):-v(V,Num,P0\P1),sn(SN,_,P1\P2),sprep(SPREP,P2\P3).


% Estructura de un sintagma preposicional

sprep(sprep(En,T),P0\P2):-enlace(En,P0\P1),termino(T,P1\P2).


% Estructuras

comppredicativo(comppredicativo(V,Cd),P0\P2):-nucleo(V,_,P0\P1),compdir(Cd,P1\P2).

propsubadj(propsubadj(NX,V,A),P0\P3):-nexo(NX,P0\P1),nucleo(V,_,P1\P2),atributo(A,P2\P3).

compnombre(compnombre(E,T),P0\P2):-enlace(E,P0\P1),termino(T,P1\P2).

compagente(compagente(E,T),P0\P2):-enlace(E,P0\P1),termino(T,P1\P2).

compcircunstancial(compcircunstancial(Prep),P0\P1):-sprep(Prep,P0\P1).

compindir(compindir(PRO),P0\P1):-pron(PRO,_,_,P0\P1).
% compindir(indcompdir(PRO),P0\P1):-pron(PRO,Num,Gen,P0\P1).

compdir(compdir(Det,N),P0\P2):-det(Det,Num,Gen,P0\P1),nombre(N,Num,Gen,P1\P2).
compdir(compdir(PRO),P0\P1):-pron(PRO,_,_,P0\P1).
compdir(compdir(N),P0\P1):-n(N,_,_,P0\P1).

enlace(enlace(Aa,Bb,Cc),P0\P3):-prep(Aa,P0\P1),v(Bb,_,P1\P2),prep(Cc,P2\P3).
enlace(enlace(Aa),P0\P1):-prep(Aa,P0\P1).

termino(termino(T),P0\P1):-nucleo(T,_,_,P0\P1).
termino(termino(T,Adj),P0\P2):-nucleo(T,Num,Gen,P0\P1),adjetivo(Adj,Num,Gen,P1\P2).
termino(termino(D,N),P0\P2):-det(D,Num,Gen,P0\P1),nucleo(N,Num,Gen,P1\P2).

atributo(atributo(D,N),P0\P2):-det(D,Num,Gen,P0\P1),nucleo(N,Num,Gen,P1\P2).
atributo(atributo(N),P0\P1):-nucleo(N,_,_,P0\P1).

interjeccion(interjeccion(Aj,V),P0\P2):-adj(Aj,Num,_,P0\P1),v(V,Num,P1\P2).


pron(pron(PRO),Num,Gen,P0\P1):-pr(PRO,Num,Gen,P0\P1).
adverbio(adverbio(AD),P0\P1):-adv(AD,P0\P1).
pr_reflexivo(pr_reflexivo(PRO),Num,P0\P1):-prrefl(PRO,Num,P0\P1).
adjetivo(adjetivo(Adj),Num,Gen,P0\P1):-adj(Adj,Num,Gen,P0\P1).

% nucleo(nucleo(N),Num,Gen,P0\P1):-pr(N,Num,Gen,P0\P1).
det(det(Det),Num,Gen,P0\P1):-de(Det,Num,Gen,P0\P1).
nombre(nombre(N),Num,Gen,P0\P1):-n(N,Num,Gen,P0\P1).
nucleo(nucleo(N),Num,Gen,P0\P1):-nombre(N,Num,Gen,P0\P1).
nucleo(nucleo(N),Num,Gen,P0\P1):-pron(N,Num,Gen,P0\P1).

nucleo(nucleo(V),Num,P0\P1):-verbo(V,Num,P0\P1).
nucleo(nucleo(Det,N,AD),Num,Gen,P0\P3):-det(Det,Num,Gen,P0\P1),nombre(N,Num,Gen,P1\P2),adjetivo(AD,Num,Gen,P2\P3).
nexo(nexo(NX),P0\P1):-conj(NX,P0\P1).
verbo(verbo(N),Num,P0\P1):-v(N,Num,P0\P1).


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Base de datos extensiva (diccionario).
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    prrefl(se, sing,[se|X]\X).
    prrefl(se, plu,[se|X]\X).

    pr(nosotros, plu, masc, [nosotros|X]\X).
    pr(algo, sing, masc, [algo|X]\X).
    pr(le, sing, masc, [le|X]\X).
    pr(les, plu, masc, [les|X]\X).
    pr(el, sing, masc, [el|X]\X).
    pr(la, sing, fem, [la|X]\X).
    pr(los, plu, masc, [los|X]\X).
    pr(las, plu, fem, [las|X]\X).



    de(el, sing, masc, [el|X]\X).
    de(la, sing, fem, [la|X]\X).
    de(los, plu, masc, [los|X]\X).
    de(las, plu, fem, [las|X]\X).

    de(esto, sing, masc, [esto|X]\X).
    de(esta, sing, fem, [esta|X]\X).
    de(estos, plu, masc, [estos|X]\X).
    de(estas, plu, fem, [estas|X]\X).


     
    prep(de,[de|X]\X).
    prep(a,[a|X]\X).
    prep(con,[con|X]\X).
    prep(en,[en|X]\X).
    prep(por,[por|X]\X).     


     
    v(teniendo,sing,[teniendo|X]\X).
    v(teniendo,plu,[teniendo|X]\X).    
    v(mueve,sing,[mueve|X]\X).
    v(pierde,sing,[pierde|X]\X).

    v(pesar,sing,[pesar|X]\X).
    v(pesar,plu,[pesar|X]\X).
    v(dicho,sing,[dicho|X]\X).

    v(tiene,sing,[tiene|X]\X).
    v(tienen,plu,[tienen|X]\X).
    v(falta,sing,[falta|X]\X).
    v(faltan,plu,[faltan|X]\X).

    v(hace,sing,[hace|X]\X).
    v(es,sing,[es|X]\X).
    v(somos,plu,[somos|X]\X).
    
    v(comia,sing,[comia|X]\X).

    v(come,sing,[come|X]\X).
    v(comia,sing,[comia|X]\X).
    v(comen,plu,[comen|X]\X).
    v(comian,plu,[comian|X]\X).
     
    v(bebe,sing,[bebe|X]\X).
    v(bebia,sing,[bebia|X]\X).
    v(beben,plu,[beben|X]\X).
    v(bebian,plu,[bebian|X]\X).
    
	v(amados,plu,[amados|X]\X).


    n('Juan',sing, masc,['Juan'|X]\X).
    n('Elena',sing, fem,['Elena'|X]\X).

    n(amor,sing, masc,[amor|X]\X).
    n(luz,sing, fem, [luz|X]\X).
    n(ocasion,sing, fem, [ocasion|X]\X).
    n(conviccion,sing, fem, [conviccion|X]\X).
    n(convicciones,plu, fem, [convicciones|X]\X).

    n(ciego,sing, masc,[ciego|X]\X).
    n(ciega,sing, fem, [ciega|X]\X).
    n(ciegos,plu, masc, [ciegos|X]\X).
    n(ciegas,plu, fem, [ciegas|X]\X).

    n(vida,sing, fem, [vida|X]\X).
    n(vidas,plu, fem, [vidas|X]\X).

    n(dicho,sing, masc,[dicho|X]\X).
    n(dicha,sing, fem, [dicha|X]\X).
    n(dichos,plu, masc, [dichos|X]\X).
    n(dichas,plu, fem, [dichas|X]\X).

    n(ladron,sing, masc, [ladron|X]\X).

    n(molino,sing, masc, [molino|X]\X).
    n(molinos,plu, masc, [molinos|X]\X).
     
    n(agua,sing,masc,[agua|X]\X).
    n(aguas,plu, fem, [aguas|X]\X).
     
    n(chico,sing, masc,[chico|X]\X).
    n(chica,sing, fem, [chica|X]\X).
    n(chicos,plu, masc, [chicos|X]\X).
    n(chicas,plu, fem, [chicas|X]\X).

    n(cafeteria,sing,fem,[cafeteria|X]\X).
    n(cafeterias,plu,fem,[cafeterias|X]\X).
     
    n(casa,sing,fem,[casa|X]\X).
    n(casas,plu,fem,[casas|X]\X).
     
    n(cafe,sing,masc,[cafe|X]\X).
    n(cafes,plu,masc,[cafes|X]\X).

    n(amados,plu,masc,[amados|X]\X).

    adj(mismo,sing,masc,[mismo|X]\X).
    adj(mismos,plu,masc,[mismos|X]\X).
    adj(misma,sing,fem,[misma|X]\X).
    adj(mismas,plu,fem,[mismas|X]\X).

    adj(supremo,sing,masc,[supremo|X]\X).
    adj(supremos,plu,masc,[supremos|X]\X).
    adj(suprema,sing,fem,[suprema|X]\X).
    adj(supremas,plu,fem,[supremas|X]\X).

    adj(mejor,sing,masc,[mejor|X]\X).
    adj(mejor,sing,fem,[mejor|X]\X).      
    adj(alto,sing,masc,[alto|X]\X).
    adj(alta,sing,fem,[alto|X]\X).
    adj(altos,plu,masc,[altos|X]\X).
    adj(altas,plu,fem,[altas|X]\X).
     
    adj(bueno,sing,masc,[bueno|X]\X).
    adj(buena,sing,fem,[buena|X]\X).
    adj(buenos,plu,masc,[buenos|X]\X).
    adj(buenas,plu,fem,[buenas|X]\X).
    adj(malo,sing,masc,[malo|X]\X).
    adj(mala,sing,fem,[mala|X]\X).
    adj(malos,plu,masc,[malos|X]\X).
    adj(malas,plu,fem,[malas|X]\X).

    adj(pasada, sing,fem,[pasada|X]\X).
    adj(pasada, sing,masc,[pasada|X]\X).
    adj(pasadas,plu,fem,[pasadas|X]\X).
    adj(pasado, sing, masc,[pasado|X]\X).
    adj(pasados,plu, masc,[pasados|X]\X).


     
    adv(no,[no|X]\X).



    conj('de que',['de que'|X]\X).


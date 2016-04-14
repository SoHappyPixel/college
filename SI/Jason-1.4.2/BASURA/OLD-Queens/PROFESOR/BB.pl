bb(Size,Size,Size,[[Size,Size]]).
bb(It,It,Size,[[It,It]|L]):- N_val is It+1, bb(N_val,It,Size,L).
bb(Size,It,Size,[[Size,It]|L]):- N_it is It+1, bb(0,N_it,Size,L).
bb(Val,It,Size,[[Val,It]|L]):- N_val is Val+1, bb(N_val,It,Size,L).

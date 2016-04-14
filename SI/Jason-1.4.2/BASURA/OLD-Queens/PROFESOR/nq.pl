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

nq(I,X,Y,[[I,Y],[X,I]|L]):-


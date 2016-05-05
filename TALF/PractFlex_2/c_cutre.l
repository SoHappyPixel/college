%x COMENTARIO
%x DEF
%{
	short int cont;
	struct map {char* key; char* value;};
	struct map kv[10];
%}

%% 

"/*" {BEGIN(COMENTARIO);}
<COMENTARIO>. ;
<COMENTARIO>[ \t]*\n ;
<COMENTARIO>"*/"[ \t]*\n* {BEGIN(INITIAL);}

"#define" {BEGIN(DEF);}
<DEF>[ ]+[A-Z]+[ ]+ { kv[cont].key = yytext; }
<DEF>[ ]+[0-9]*[a-zA-Z]*[ ]+\n { kv[cont].value = yytext; cont++; BEGIN(INITIAL);}

^[ ]*"//".*\n		;
"//".*				;
^" "*\n				;
^" "+	fprintf(yyout,"%s",yytext);
" "+	fprintf(yyout,"%s"," "); 
" "+$				; 
"#include".*\n*		;

%% 

int yywrap(){ return 1; }
int main(int argc,char *argv[])
{ 
	printf("HEY: %s\n", kv[1].key);
	printf("Cont: %d\n", cont);
	for(int i=0; i<cont-1; ++i) 
		printf("K=%s : V=%s\n", kv[i].key, kv[i].value);
	
	yyin=fopen(argv[1],"r");
	yyout=fopen(argv[2],"w");
    while (yylex());
}
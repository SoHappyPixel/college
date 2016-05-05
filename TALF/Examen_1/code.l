%{ 
   	#include <stdio.h> 
	int num_lineas = 1;
%}

RESERVADAS "auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"

%% 

\n 	num_lineas++;

"}"|"{" ;

\"(.*\n*.*)\" printf("Linea %d, cadena: %s \n", num_lineas+1, yytext);

{RESERVADAS}" " printf("Linea %d, palabra: %s \n", num_lineas+1, yytext);

[^{RESERVADAS}] ;

%% 

int yywrap(){ return 1; }
int main(int argc,char *argv[])
{
	yyin=fopen(argv[1],"r");
    while (yylex());
}

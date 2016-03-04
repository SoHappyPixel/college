%{ 
   	#include <string.h> 
   	#include <stdio.h> 

	float f = 0;
	char mayor[20];
	int i = 0, longM = 0;
%}

N [+-]?[0-9]+
STR [-+.0-9a-zA-Z]+
F [+-]?[0-9]+\.[0-9]+[eE]?[-+]?[0-9]+

%% 

"//".* ;

{F} { float real = atof(yytext); f += real; }

{N} { int entero = atoi(yytext); i += entero; }

{STR} { printf("%zu/%s/", yyleng,yytext); if(longM<yyleng){ longM = yyleng; strcpy(mayor,yytext); } }

%% 

int yywrap(){ return 1; }
int main(int argc,char *argv[])
{
	yyin=fopen(argv[1],"r"); while(yylex()){}
    printf("\n\n\nLa suma de los reales es %f\n", (float)i+f);
    printf("\nLa palabra mas larga es \"%s\", con longitud %d", mayor, longM);  
}

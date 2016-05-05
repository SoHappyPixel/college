%{
#include <stdio.h>
#include "cutre.tab.h"

int linea = 1;
%}

ALFA                    [A-Za-z_]
ALFANUM                 [A-Za-z_0-9]

ESCAP                   ['?\\abfnrtv]
CARACT                  [^\\\n']|\\{ESCAP}

ENT                     [0-9]+
FRAC                    [0-9]*\.[0-9]+
EXP                     [eE][+-]?[0-9]+

%x COMENTARIO CADENA

%%

"array"                    { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(ARRAY); }
"cabecera"                 { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(CABECERA); }
"caracter"                 { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(CARACTER); }
"conjunto"                 { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(CONJUNTO); }
"continuar"                { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(CONTINUAR); }
"constantes"               { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(CONSTANTES); }
"devolver"                 { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(DEVOLVER); }
"entero"                   { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(ENTERO); }
"es"                       { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(ES); }
"escape"                   { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(ESCAPE); }
"estructura"               { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(ESTRUCTURA); }
"etiqueta"                 { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(ETIQUETA); }
"fichero"                  { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(FICHERO); }
"fin"                      { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(FIN); }
"funcion"                  { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(FUNCION); }
"hash"                     { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(HASH); }
"haz"                      { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(HAZ); }
"ir_a"                     { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(IR_A); }
"mientras"                 { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(MIENTRAS); }
"nada"                     { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(NADA); }
"para"                     { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(PARA); }
"para_cada"                { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(PARA_CADA); }
"principio"                { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(PRINCIPIO); }
"programa"                 { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(PROGRAMA); }
"real"                     { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(REAL); }
"ref"                      { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(REF); }
"si"                       { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(SI); }
"sino"                     { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(SINO); }
"si_encambio"              { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(SI_ENCAMBIO); }
"tamano"                   { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(TAMANO); }
"tipos"                    { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(TIPOS); }
"union"                    { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(UNION); }
"variables"                { printf("linea %d, palabra reservada: %s\n", linea, yytext); return(VARIABLES); }

"#".+                      ;

'{CARACT}'                 { printf("linea %d, caracter: %s\n", linea, yytext); return(CTC_CARACTER); }

'                          { BEGIN(CADENA); printf("linea %d, cadena: \'", linea); }
<CADENA>{CARACT}           ECHO;
<CADENA>\\\n               { linea++; ECHO; }
<CADENA>'                  { ECHO; printf("\n"); BEGIN(INITIAL); return(CTC_CADENA); }
<CADENA>.                  { printf ("\nlinea %d, error\n",linea); }

{ALFA}{ALFANUM}*           { printf("linea %d, identificador: %s\n", linea, yytext); return(IDENTIFICADOR); }

{ENT}                      { printf("linea %d, ctc entera: %s\n", linea, yytext); return(CTC_ENTERA); }

{ENT}{EXP}                 |
{FRAC}{EXP}?               { printf("linea %d, ctc real: %s\n", linea, yytext); return(CTC_REAL); }

\"[^"]+\.cab\"             { printf("linea %d, librería: %s\n", linea, yytext); return(PATH); }

"{"                        |
"}"                        |
"("                        |
")"                        |
"?"                        |
":"                        |
","                        |
";"                        { printf("linea %d, delimitador: %s\n", linea, yytext); return(yytext[0]); }

"**"                       { printf("linea %d, operador %s\n", linea, yytext); return (POTENCIA); }
"<<"                       { printf("linea %d, operador %s\n", linea, yytext); return (DESPI); }
">>"                       { printf("linea %d, operador %s\n", linea, yytext); return (DESPD); }
"+="                       { printf("linea %d, operador %s\n", linea, yytext); return (SUMA_ASIG); }
"-="                       { printf("linea %d, operador %s\n", linea, yytext); return (RESTA_ASIG); }
"*="                       { printf("linea %d, operador %s\n", linea, yytext); return (MULT_ASIG); }
"/="                       { printf("linea %d, operador %s\n", linea, yytext); return (DIV_ASIG); }
"%="                       { printf("linea %d, operador %s\n", linea, yytext); return (MOD_ASIG); }
"<<="                      { printf("linea %d, operador %s\n", linea, yytext); return (DESPI_ASIG); }
">>="                      { printf("linea %d, operador %s\n", linea, yytext); return (DESPD_ASIG); }
"&="                       { printf("linea %d, operador %s\n", linea, yytext); return (AND_ASIG); }
"@="                       { printf("linea %d, operador %s\n", linea, yytext); return (XOR_ASIG); }
"|="                       { printf("linea %d, operador %s\n", linea, yytext); return (OR_ASIG); }
"**="                      { printf("linea %d, operador %s\n", linea, yytext); return (POT_ASIG); }
"<="                       { printf("linea %d, operador %s\n", linea, yytext); return (GE); }
">="                       { printf("linea %d, operador %s\n", linea, yytext); return (LE); }
"=="                       { printf("linea %d, operador %s\n", linea, yytext); return (EQ); }
"!="                       { printf("linea %d, operador %s\n", linea, yytext); return (NEQ); }
"&&"                       { printf("linea %d, operador %s\n", linea, yytext); return (AND); }
"||"                       { printf("linea %d, operador %s\n", linea, yytext); return (OR); }
"->"                       { printf("linea %d, operador %s\n", linea, yytext); return (FLECHA_SIMPLE); }
"=>"                       { printf("linea %d, operador %s\n", linea, yytext); return (FLECHA_DOBLE); }

"-"                        |
"+"                        |
"*"                        |
"/"                        |
"%"                        |
"."                        |
"&"                        |
"["                        |
"]"                        |
"~"                        |
"|"                        |
"@"                        |
"^"                        |
\\                         |
"<"                        |
">"                        |
"!"                        |
"="                        { printf("linea %d, operador %s\n", linea, yytext); return (yytext[0]); }

[ \t]                      ;
\n                         linea++;
.                          { printf ("linea %d, error\n",linea); exit(0); }

%%



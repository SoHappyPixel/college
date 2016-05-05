%{

  #include <stdio.h>
  extern FILE *yyin;
  extern int yylex();

//  #define YYDEBUG 1
%}

%token AND AND_ASIG ARRAY HASH CABECERA CADENA CARACTER CONJUNTO CONSTANTES
%token CONTINUAR CTC_CADENA CTC_CARACTER CTC_ENTERA CTC_REAL DESPD DESPD_ASIG
%token DESPI DESPI_ASIG DIV_ASIG DEVOLVER ENTERO EQ ES ESCAPE ESTRUCTURA ETIQUETA
%token FLECHA_DOBLE FLECHA_SIMPLE FICHERO FIN FUNCION HAZ GE IDENTIFICADOR
%token IR_A LE MIENTRAS MOD_ASIG MULT_ASIG NADA NEQ PATH OR OR_ASIG PARA PARA_CADA
%token POT_ASIG PRINCIPIO PROGRAMA POTENCIA REAL RESTA_ASIG SI SINO SI_ENCAMBIO
%token SUMA_ASIG TAMANO TIPOS REF UNION VARIABLES XOR_ASIG 

%left OR AND GE
%right '-' '+' '<' '>' LE
%right POTENCIA

%%

/************/
/* programa */
/************/

programa: cabecera bloque  { printf ("ACEPTAR: programa -> cabecera bloque\n"); }
    ;

cabecera: PROGRAMA IDENTIFICADOR ';' ficheros_cabecera { printf ("  cabecera -> PROGRAMA ID ';' fichs_cabecera\n"); }
    ;

ficheros_cabecera
    :                                     { printf ("  fichs_cabecera -> \n"); }
    | ficheros_cabecera fichero_cabecera  { printf ("  fichs_cabecera -> fichs_cabecera fich_cabecera\n"); }
    ;
    
fichero_cabecera
    : CABECERA PATH ';'  { printf ("  fich_cabecera -> CABECERA PATH\n"); }
    ;

bloque
    : declaraciones_tipos 
      declaraciones_constantes 
      declaraciones_variables
      declaraciones_funciones
      bloque_instrucciones     { printf ("  blq -> decl_tipos decl_ctcs decl_vars decl_funs blq_ins\n"); }
    ;

/************************/
/* declaracion de tipos */
/************************/

declaraciones_tipos
    :                                     { printf ("  decl_tipos -> \n"); }
    | TIPOS lista_declaraciones_tipo FIN  { printf ("  decl_tipos -> TIPO lista_declr_tipos FIN\n"); }
    ;

lista_declaraciones_tipo
    : declaracion_tipo                           { printf ("  lista_declr_tipos -> declr_tipo\n"); }
    | lista_declaraciones_tipo declaracion_tipo  { printf ("  lista_declr_tipos -> lista_declr_tipos declr_tipo\n"); }
    ;

declaracion_tipo: IDENTIFICADOR ES especificacion_tipo ';'  { printf ("  declr_tipo -> ID ES espec_tipo\n"); }
    ;

especificacion_tipo
    : referencias tipo_basico  { printf ("  espec_tipo -> refs tipo_basico\n"); }
    ;
    
referencias
    :                  { printf ("  refs -> \n"); }
    | referencias REF  { printf ("  refs -> refs REF\n"); }
    ;
    
tipo_basico
    : IDENTIFICADOR      { printf ("  tipo_basico -> ID\n"); }
    | tipo_escalar       { printf ("  tipo_basico -> tipo_escalar\n"); }
    | tipo_enumerado     { printf ("  tipo_basico -> tipo_enum\n"); }
    | tipo_estructurado  { printf ("  tipo_basico -> tipo_struct\n"); }
    ;

tipo_escalar
    : ENTERO    { printf ("  tipo_escalar -> ENTERO\n"); }
    | REAL      { printf ("  tipo_escalar -> REAL\n"); }
    | CARACTER  { printf ("  tipo_escalar -> CARACTER\n"); }
    | CADENA    { printf ("  tipo_escalar -> CADENA\n"); }
    | FICHERO   { printf ("  tipo_escalar -> FICHERO\n"); }
    ;

tipo_enumerado
    : ARRAY especificacion_tipo     { printf ("  array -> ARRAY espec_tipo\n"); }
    | HASH especificacion_tipo      { printf ("  array -> HASH espec_tipo\n"); }
    | CONJUNTO especificacion_tipo  { printf ("  array -> CONJUNTO espec_tipo\n"); }
    ;

tipo_estructurado
    : ESTRUCTURA PRINCIPIO lista_campos FIN  { printf ("  tipo_struct -> ESTRUCT PRINCPIO lista_campos FIN\n"); }
    | UNION PRINCIPIO lista_campos FIN       { printf ("  tipo_struct -> UNION PRINCPIO lista_campos FIN\n"); }
    ;

lista_campos
    : linea_campo               { printf ("  lista_campos -> linea_campos\n"); }
    | lista_campos linea_campo  { printf ("  lista_campos -> lista_campos linea_campos\n"); }
    ;

linea_campo
    : lista_identificadores ES especificacion_tipo ';'  { printf ("  lista_campos -> lista_ids ES espec_tipo\n"); }
    ;

lista_identificadores
    : IDENTIFICADOR                            { printf ("  lista_ids -> ID\n"); }
    | lista_identificadores ',' IDENTIFICADOR  { printf ("  lista_ids -> lista_ids ',' ID\n"); }
    ;

/*****************************/
/* declaracion de constantes */
/*****************************/

declaraciones_constantes
    :                                     { printf ("  decl_constantes -> \n"); }
    | CONSTANTES lista_declaraciones_constante FIN  { printf ("  decl_constantes -> CONSTANTES lista_declr_constantes FIN\n"); }
    ;

lista_declaraciones_constante
    : declaracion_constante                           { printf ("  lista_declr_constantes -> declr_constante\n"); }
    | lista_declaraciones_constante declaracion_constante  { printf ("  lista_declr_constantes -> lista_declr_constantes declr_constante\n"); }
    ;

declaracion_constante: IDENTIFICADOR ES tipo_basico '=' constante  ';'  { printf ("  declr_constante -> ID ES tipo_basico '=' constante\n"); }
    ;

constante
    : expresion_constante	{ printf ("  constante -> expresion_constante \n"); }
    | constante_enumerada	{ printf ("  constante -> constante_enumerada \n"); }
    | constante_estructurada	{ printf ("  constante -> constante_estructurada \n"); }
    ;

constante_enumerada
    :	'(' ')'				{ printf (" constante_enumerada -> lista_const \n");} 
    |	'(' lista_const ')'	{ printf (" constante_enumerada -> lista_const \n");}
    |   '(' lista_hash ')'	{ printf (" constante_enumerada -> lista_hash \n");}
    ;

lista_const
    :	constante			{ printf (" lista_const -> constante \n");}
    |	lista_const ',' constante	{ printf (" lista_const -> lista_const ',' constante");}
    ;

lista_hash
    :	elemento_hash			{ printf (" lista_hash -> elemento_hash \n");}
    |	lista_hash ',' elemento_hash	{ printf (" lista_hash -> lista_hash ',' elemento_hash \n");}
    ;

elemento_hash
    :	CTC_CADENA FLECHA_DOBLE constante	{ printf (" CTC_CADENA FLECHA_DOBLE constante \n");}
    ;

constante_estructurada
    : 	'{' lista_estruc '}'	{ printf (" constante_estruc -> lista_estruc \n");}
    ;

lista_estruc
    :	campo_cte			{ printf (" lista_estruc -> campo_cte\n");}
    |	lista_estruc ',' campo_cte	{ printf (" lista_estruc -> lista_estruc ',' campo_cte \n");}
    ;

campo_cte
    :	IDENTIFICADOR '=' constante	{ printf (" campo_cte -> ID '=' constante \n");}
    ;



/****************************/
/* declaracion de variables */
/****************************/

declaraciones_variables
    :                                     { printf ("  decl_variables -> \n"); }
    | VARIABLES lista_declaraciones_variable FIN  { printf ("  decl_variables -> VARIABLES lista_declr_variables FIN\n"); }
    ;

lista_declaraciones_variable
    : declaracion_variable                { printf (" lista_declr_variables -> declr_variable\n"); }
    | lista_declaraciones_variable declaracion_variable  { printf ("  lista_declr_variables -> lista_declr_variables declr_variable\n"); }
    ;

declaracion_variable
    : lista_identificadores ':' especificacion_tipo  ';'  { printf ("  declr_variable -> lista_identificadores ':' especificacion_tipo\n"); }
    ;

/****************************/
/* declaracion de funciones */
/****************************/
    
declaraciones_funciones
    :			{ printf ("  declaraciones_funciones ->\n"); }	
    | declaraciones_funciones declaracion_funcion	{ printf ("  declaraciones_funciones -> declaraciones_funciones declaracion_funcion \n"); }
    ;

declaracion_funcion
    : FUNCION IDENTIFICADOR'(' lista_parametros ')' FLECHA_SIMPLE tipo_salida cuerpo_funcion  { printf ("  declr_funcion -> FUNCION IDENTIFICADOR lista_parametros '->' tipo_salida cuerpo_funcion \n"); }
    ;

lista_parametros
    :                                         	 { printf ("  lista_parametros -> \n"); }
    | parametros                      		 { printf ("  lista_parametros -> parametros \n"); }			
    | lista_parametros ';' parametros 		 { printf ("  lista_parametros -> lista_parametros \n"); }
    ;

parametros
    : lista_identificadores ':' especificacion_tipo  { printf ("  parametros -> lista_identificadores ':' especificacion_tipo \n"); }
    ;

tipo_salida
    : especificacion_tipo 		{ printf ("  tipo_salida -> especificacion_tipo \n"); }
    | NADA			        { printf ("  tipo_salida -> NADA \n"); }
    ;

cuerpo_funcion
    : declaraciones			{ printf("declaraciones");}
     bloque_instrucciones		{ printf ("  cuerpo_funcion -> bloque_instrucciones \n"); }
    ;

declaraciones
    : declaraciones_constantes 		{ printf ("  cuerpo_funcion -> declaraciones_constantes \n"); }
    | declaraciones_variables		{ printf ("  cuerpo_funcion -> declaraciones_variables \n"); }
    | declaraciones_funciones		{ printf ("  cuerpo_funcion -> declaracion_funcion \n"); }
    ;

/*****************/
/* instrucciones */
/*****************/

bloque_instrucciones
    : PRINCIPIO lista_instrucciones FIN		{ printf ("  bloque_instrucciones -> PRINCIPIO lista_instrucciones FIN \n"); }
    ;

lista_instrucciones
    : instruccion			{ printf ("  lista_instrucciones -> instruccion \n"); }
    | lista_instrucciones instruccion   { printf ("  lista_instrucciones -> lista_instrucciones instruccion \n"); }
    ;

instruccion
    : instruccion_expresion		{ printf ("  instruccion -> instruccion_expresion \n"); }
    | instruccion_bifurcacion		{ printf ("  instruccion -> instruccion_bifurcacion \n"); }
    | instruccion_bucle			{ printf ("  instruccion_bucle \n"); }
    | instruccion_salto			{ printf ("  instruccion_salto \n"); }
    | instruccion_destino_salto		{ printf ("  instruccion -> instruccion_destino_salto \n"); }
    | instruccion_devolver		{ printf ("  instruccion -> instruccion_devolver \n"); }
    ;

instruccion_expresion
    : expresion_funcional ';'		{ printf ("  instruccion_expresion -> expresion_funcional \n"); }
    | asignacion ';'			{ printf ("  instruccion_expresion -> asignacion \n"); }
    ;

asignacion
    : expresion_indexada operador_asignacion expresion	{ printf ("  asignacion -> expresion_indexada operador_asignacion expresion \n"); }
    ;

operador_asignacion
    : '=' 			{ printf ("  operador_asignacion -> '=' \n"); }
    | POT_ASIG 			{ printf ("  operador_asignacion -> POT_ASIG \n"); }
    | MULT_ASIG 		{ printf ("  operador_asignacion -> MULT_ASIG \n"); }
    | DIV_ASIG			{ printf ("  operador_asignacion -> DIV_ASIG \n"); } 
    | MOD_ASIG 			{ printf ("  operador_asignacion -> MOD_ASIG \n"); }
    | SUMA_ASIG			{ printf ("  operador_asignacion -> SUMA_ASIG \n"); } 
    | RESTA_ASIG 		{ printf ("  operador_asignacion -> RESTA_ASIG \n"); }
    | DESPI_ASIG 		{ printf ("  operador_asignacion -> DESPI_ASIG \n"); }
    | DESPD_ASIG 		{ printf ("  operador_asignacion -> DESPD_ASIG \n"); }
    | AND_ASIG 			{ printf ("  operador_asignacion -> AND_ASIG \n"); }
    | XOR_ASIG 			{ printf ("  operador_asignacion -> XOR_ASIG \n"); }
    | OR_ASIG			{ printf ("  operador_asignacion -> OR_ASIG \n"); }
    ;

instruccion_bifurcacion
    : SI '(' expresion ')' accion casos FIN  { printf ("  instruccion_bifurcacion -> SI '(' expresion ')' accion casos FIN \n"); }
    ;

casos
    : 				{ printf ("  casos -> \n"); }
    | lista_otros_casos		{ printf ("  casos -> lista_otros_casos \n"); }
    | SINO accion		{ printf ("  casos -> SINO accion \n"); }
    ;

lista_otros_casos
    : otros_casos				{ printf ("  lista_otros_casos -> otros_casos \n"); }
    | lista_otros_casos otros_casos		{ printf ("  lista_otros_casos -> lista_otros_casos otros_casos \n"); }
    ;

otros_casos
    : SI_ENCAMBIO '(' expresion ')' accion	{ printf ("  otros_casos -> SI_ENCAMBIO '(' expresion ')' accion \n"); }
    ;

accion
    : instruccion		{ printf ("  accion -> instruccion \n"); }
    | bloque_instrucciones	{ printf ("  accion -> bloque_instrucciones \n"); }
    ;

instruccion_bucle
    : MIENTRAS '(' expresion ')' accion			{ printf ("  instruccion_bucle -> MIENTRAS '(' expresion ')' accion \n"); }
    | HAZ accion MIENTRAS '(' expresion ')' ';'		{ printf ("  instruccion_bucle -> HAZ accion MIENTRAS '(' expresion ')' ';' \n"); }
    | PARA '(' lista_asignaciones ';' expresion ';' lista_asignaciones ')' accion  { printf ("  instruccion_bucle -> PARA '(' lista_asignaciones ';' expresion ';' lista_asignaciones ')' accion \n"); }
    | PARA_CADA IDENTIFICADOR '(' expresion ')' accion		{ printf ("  instruccion_bucle -> PARA_CADA IDENTIFICADOR '(' expresion ')' accion \n"); }
    ;

lista_asignaciones
    : 					{ printf ("  lista_asignaciones -> \n"); }
    | asignacion			{ printf ("  lista_asignaciones -> asignacion \n"); }
    | lista_asignaciones ',' asignacion     { printf ("  lista_asignaciones -> lista_asignaciones ',' asignacion \n"); }
    ;

instruccion_salto
    : IR_A IDENTIFICADOR ';' 		{ printf ("  instruccion_salto -> IR_A IDENTIFICADOR \n"); }
    | CONTINUAR ';' 			{ printf ("  instruccion_salto -> CONTINUAR \n"); }
    | ESCAPE ';'			{ printf ("  instruccion_salto -> ESCAPE \n"); }
    ;

instruccion_destino_salto
    : ETIQUETA IDENTIFICADOR ';'	{ printf ("  instruccion_destino_salto -> ETIQUETA IDENTIFICADOR \n"); }
    ;

instruccion_devolver
    : DEVOLVER expresion ';'		{ printf ("  instruccion_devolver -> DEVOLVER expresion \n"); }
    ;

/***************/
/* expresiones */
/***************/

expresion_constante
    : CTC_ENTERA		{ printf ("  constante -> CTC_ENTERO\n"); }
    | CTC_REAL			{ printf ("  constante -> CTC_REAL\n"); }
    | CTC_CARACTER		{ printf ("  constante -> CTC_CARACTER\n"); }
    | CTC_CADENA		{ printf ("  constante -> CTC_CADENA\n"); }
    ;

expresion_indexada
    : expresion_basica						{ printf ("  expresion_indexada -> expresion_basica \n"); }
    | expresion_indexada '.' expresion_basica			{ printf ("  expresion_indexada -> expresion_indexada '.' expresion_basica \n"); }
    | expresion_indexada FLECHA_SIMPLE expresion_basica		{ printf ("  expresion_indexada -> expresion_indexada '->' expresion_basica \n"); }
    | expresion_indexada indice			{ printf ("  expresion_indexada -> expresion_indexada '->' expresion_basica \n"); }
| expresion_indexada FLECHA_SIMPLE indice			{ printf ("  expresion_indexada -> expresion_indexada '->' expresion_basica \n"); }
    ;

expresion_basica
    : '(' expresion ')'			{ printf ("  expresion_basica -> expresion \n"); }
    | '^' expresion_basica		{ printf ("  expresion_basica -> '^' expresion_basica \n"); }
    | '\\' expresion_basica		{ printf ("  expresion_basica -> \\ expresion_basica \n"); }
    | IDENTIFICADOR			{ printf ("  expresion_basica -> IDENTIFICADOR \n"); }
    ;

indice
    : '[' expresion ']' 		{ printf ("  indice -> '[' expresion ']' \n"); }
    | '{' expresion '}'			{ printf ("  indice -> '{' expresion '}' \n"); }
    ;

expresion_funcional
    : IDENTIFICADOR '(' lista_expresiones ')'		{ printf ("  expresion_funcional -> IDENTIFICADOR '(' lista_expresiones ')' \n"); }
    ;

lista_expresiones
    :					{printf (" lista_expresiones -> \n"); }
    | expresion				{printf (" lista_expresiones -> expresion \n"); }
    | lista_expresiones ',' expresion	{printf (" lista_expresiones -> lista_expresiones ',' expresion\n"); }
    ;

expresion
    /* expresion_logica evaluar	{printf (" expresion -> expresion_logica evaluar \n"); }
  */: expresion_constante 	{printf (" expresion -> expresion_constante \n"); }
    | expresion_indexada	{printf (" expresion -> expresion_indexada \n"); }
    | expresion_funcional	{printf (" expresion -> expresion_funcional \n"); }
    | expresion GE expresion	{printf (" expresion -> expresion binary_op_ge expresion \n"); }
    | expresion OR expresion	{printf (" expresion -> expresion logic_or expresion \n"); }
    | expresion AND expresion	{printf (" expresion -> expresion AND expresion \n"); }
    | expresion '+' expresion   {printf (" expresion -> expresion + expresion \n"); }
    | expresion '-' expresion   {printf (" expresion -> expresion - expresion \n"); }
    | expresion '<' expresion   {printf (" expresion -> expresion < expresion \n"); }
    | expresion '>' expresion   {printf (" expresion -> expresion > expresion \n"); }
    | expresion LE expresion   {printf (" expresion -> expresion >= expresion \n"); }
    ;


%%

int yyerror(char *s) {
  fflush(stdout);
  printf("*****************, %s\n",s);
  }

int yywrap() {
  return(1);
  }

int main(int argc, char *argv[]) {

//  yydebug = 0;

  if (argc < 2) {
    printf("Uso: ./cutre NombreArchivo\n");
    }
  else {
    yyin = fopen(argv[1],"r");
    yyparse();
    }
  }
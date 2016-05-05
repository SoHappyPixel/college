cutre:	cutre.tab.c cutre.lex.c
	gcc -o cutre cutre.tab.c lex.yy.c -lm
cutre.tab.c:	cutre.y
	bison -dv cutre.y
cutre.lex.c:	cutre.l
	flex cutre.l
clean:
	rm  cutre.tab.c cutre.tab.h cutre.output lex.yy.c cutre
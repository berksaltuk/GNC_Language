parser: y.tab.c lex.yy.c
	gcc -o parser y.tab.c

y.tab.c: gnc.y
	yacc gnc.y

lex.yy.c: gnc.l
	lex gnc.l

clean:
	rm -f *.o lex.yy.c y.tab.c parser

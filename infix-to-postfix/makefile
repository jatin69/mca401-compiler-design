# Purpose of this makefile is to reduce command typing.
# Simply building executable each time.
# not generating object files intentionally.

build: infix-to-postfix.l infix-to-postfix.y
	yacc -d infix-to-postfix.y
	lex infix-to-postfix.l
	gcc lex.yy.c y.tab.c -o infix-to-postfix

debug: infix-to-postfix.l infix-to-postfix.y
	yacc -d --debug --verbose --graph infix-to-postfix.y
	lex infix-to-postfix.l
	gcc lex.yy.c y.tab.c -o infix-to-postfix

run:
	./infix-to-postfix

clean:
	rm -rf lex.yy.c y.tab.c y.tab.h a.out infix-to-postfix y.output y.dot
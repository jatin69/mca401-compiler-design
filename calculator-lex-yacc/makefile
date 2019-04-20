# Purpose of this makefile is to reduce command typing.
# Simply building executable each time.
# not generating object files intentionally.

build: calculator.l calculator.y
	yacc -d calculator.y
	lex calculator.l
	gcc lex.yy.c y.tab.c -o calculator

debug: calculator.l calculator.y
	yacc -d --debug --verbose --graph calculator.y
	lex calculator.l
	gcc lex.yy.c y.tab.c -o calculator

run:
	./calculator

clean:
	rm -rf lex.yy.c y.tab.c y.tab.h a.out calculator y.output y.dot
# mca401-compiler-design

Coursework for mca401-compiler-design

We use [GNU's flex bison](https://www.gnu.org/software/bison/manual/) for all the codes.

## package requirements

- gnu's lex yacc `sudo apt-get install bison flex`
- make utility `sudo apt-get install build-essential`

## Question Answers

<details>
<summary> How to compile lex yacc programs </summary>
<br>
Perform the following steps, in order to compile a demo program-

- `yacc -d demo.yacc`
  Process the yacc grammar file using the `-d` flag (which tells the yacc command to create a file
that defines the tokens used in addition to the C language source code)
- Use `ls` to verify that the following files were created -
  - `y.tab.c` The C language source file that the yacc command created for the parser.
  - `y.tab.h` A header file containing define statements for the tokens used by the parser.
- `lex demo.lex`
  Process the lex specification file
- Use `ls` to verify that the following file was created -
  - `lex.yy.c` The C language source file that the lex command created for the lexical analyzer.
- `cc y.tab.c lex.yy.c -o demo`
  Compile and link the two C language source files.
- Use `ls` to verify that the following files were created -
  - `demo` The executable program file

</details>

<details>
<summary> Guide to writing a yacc program </summary>
<br>

- Identify the Terminal and Non-Terminal Symbols from the BNF and Lex.
- Try coding all the grammar rules in yacc with empty actions.
  - Compile,link it to Lex and check for conflicts. 
  - This is an easy way of validating the BNF for reduce/reduce and shift/reduce conflicts.
- Search for any reduce/reduce conflict. Resolve it in Lex. Resolve any shift/reduce conflicts.
- Write rules for all possible syntax errors.Details on error handling are given later.
- Code the yyerror function in subroutine section.
- Design the Data Structure which can be easily integrated with the grammar rules for syntax directed translation.
- From the Data Structures and Lex needs ,formulate the correct Stack.The stack must have pointers for all the data structures.
- Do the appropiate type binding to all tokens and yacc variables (non-terminals).
- Write all the data structures in a seperate file and inlude it in yacc.
- Code all the actions.
- Restrict the actions in case of error, i.e no data structure should be built but parsing should continue to get more errors.

</details>

## Reference links

- Lex Yacc Introduction 
  - [http://epaperpress.com/lexandyacc/intro.html](http://epaperpress.com/lexandyacc/intro.html)
  - [http://dinosaur.compilertools.net/lex/](http://dinosaur.compilertools.net/lex/)
  - [http://dinosaur.compilertools.net/yacc/](http://dinosaur.compilertools.net/yacc/)

- Lex yacc primer
  - [http://tldp.org/HOWTO/Lex-YACC-HOWTO-7.html](http://tldp.org/HOWTO/Lex-YACC-HOWTO-7.html)

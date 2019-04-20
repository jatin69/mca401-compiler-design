%{
  #include <stdio.h>
  int yydebug=1;
  int yylex(void);
    
  int yyerror(char *errorMsg);

  int variables[26];
%}

%start start

%token DIGIT LETTER

%left '|'
%left '&'
%left '+' '-'
%left '*' '/' '%'
%left UMINUS      // supplies precedence for unary minus

%%

start:  /*empty */
  | start statement '\n'
  | start error '\n'						 		{ yyerrok;  						}
  ;

statement:  expression           		{ printf("= %d\n",$1); printf("\n");  	}
  |    LETTER '=' expression  	 		{ variables[$1] = $3;		                }
  ;

expression: '(' expression ')' 			{ $$ = $2;  						}
  |	expression '*' expression				{	$$ = $1 * $3;					}
  |	expression '/' expression 			{	$$ = $1 / $3;					}
  |	expression '%' expression   		{	$$ = $1 % $3;   			}
  |	expression '+' expression				{	$$ = $1 + $3;					}
  |	expression '-' expression				{	$$ = $1 - $3;					}
  |	expression '&' expression				{	$$ = $1 & $3;					}
  |	expression '|' expression				{	$$ = $1 | $3;					}
  |	'-' expression %prec UMINUS			{	$$ = -$2;							}
  |	LETTER													{	$$ = variables[$1];		}
  |	number
  ;

number: DIGIT												{	$$ = $1;							}
  |	number DIGIT										{	$$ = 10 * $1 + $2;		}
  ;

%%
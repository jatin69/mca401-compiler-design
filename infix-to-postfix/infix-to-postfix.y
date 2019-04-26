%{
   #include <stdio.h>
   #include <ctype.h>
   int yydebug=1;
   int yylex();
   int yyerror(char *errorMsg);
%}

%start start
%token LETTER NUMBER

%left '-' '+'
%left '*' '/'

%%

start:
     | start expression {   printf("\n");  }	
     | start error '\n'	{   yyerrok;       }
     ;

expression: '('expression')'
     | expression '+' expression { printf("+");         }
     | expression '-' expression { printf("-");         }
     | expression '*' expression { printf("*");         }
     | expression '/' expression { printf("/");         }
     | LETTER                    { printf("%c",yylval); }
     | NUMBER                    { printf("%d",yylval); } 
   ;
%%

%{
    #include <stdio.h>
    #include "y.tab.h"
    int yyerror(char *errorMsg);
%}

%%
[ \t]       	  ;
"quit"			    { exit(0);                              }
"\n"            { return 0;                             }
[()*/+-]        { return yytext[0];                     }
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z]        { yylval=*yytext; return LETTER;        }
.               { yyerror("INVALID TOKEN");             }
%%

int main() {
    printf("\n----------------------- Infix to Postfix ---------------------------\n");
    printf("\nStart entering your expressions here : \n\n");
    yyparse();
    return 0;
}


int yyerror(char *errorMsg){
    fprintf(stderr, "\n%s\n\n", errorMsg);
  exit(1);
}

int yywrap() {
  return 0;
}
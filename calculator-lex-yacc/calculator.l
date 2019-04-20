%{ 
  #include <stdio.h>
  #include "y.tab.h"
  int c;
  extern int yylval;
%}

%%
[ \t;]       	;
"quit"			{ 
                    exit(0);	
                }
"exit"			{ 
                    exit(0);	
                }
[a-z]     		{
                    c = yytext[0];
                    yylval = c - 'a';
                    return(LETTER);
                }
[0-9]     		{
                    c = yytext[0];
                    yylval = c - '0';
                    return(DIGIT);
                  }
[^a-z0-9\b]     {
                    c = yytext[0];
                    return(c);
                }
%%


int main() {
    printf("\n----------------------- Calculator ---------------------------\n");
    printf("\nStart entering your expressions here : \n\n");
    yyparse();
    return 0;
}


int yyerror(char *errorMsg){
    fprintf(stderr, "\n%s\n", errorMsg);
    exit(1);
}

int yywrap() {
  return 1;
}
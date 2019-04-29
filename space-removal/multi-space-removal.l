%option main

%%
[ \t]+      { printf(" "); }
"exit"      { exit(0);     }

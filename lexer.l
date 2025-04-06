%{
#include "parser.tab.h"
#include <string.h>
#include <stdio.h>

// Declare yyerror to avoid implicit declaration warning
void yyerror(const char *s);
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*     { yylval.str = strdup(yytext); return IDENTIFIER; }
[0-9]+                     { yylval.str = strdup(yytext); return NUMBER; }

"="                        { return ASSIGN; }
"*"                        { return MUL; }
"+"                        { return ADD; }
"-"                        { return SUB; }
"("                        { return LPAREN; }
")"                        { return RPAREN; }
";"                        { return SEMICOLON; }

[ \t\n\r]+                 { /* Skip whitespace */ }
.                          { yyerror("Unknown character"); return 0; }

%%

int yywrap(void) {
    return 1;
}

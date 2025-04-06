%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }
int yylex(void);
%}

%union {
    char* str;
}

%token <str> IDENTIFIER NUMBER
%token ASSIGN MUL ADD SUB SEMICOLON LPAREN RPAREN

%type <str> stmt expr term factor

%start program

%%

program:
    stmt SEMICOLON {
        printf("Parsed Expression: %s\n", $1);
        free($1);
    }
;

stmt:
    IDENTIFIER ASSIGN expr {
        char *result = malloc(100);
        snprintf(result, 100, "assign %s = %s", $1, $3);
        free($1);
        free($3);
        $$ = result;
    }
;

expr:
    term SUB factor {
        char *result = malloc(100);
        snprintf(result, 100, "(%s - %s)", $1, $3);
        free($1);
        free($3);
        $$ = result;
    }
  | term {
        $$ = $1;
    }
;

term:
    term MUL factor {
        char *result = malloc(100);
        snprintf(result, 100, "(%s * %s)", $1, $3);
        free($1);
        free($3);
        $$ = result;
    }
  | factor {
        $$ = $1;
    }
;

factor:
    IDENTIFIER {
        $$ = strdup($1);
        free($1);
    }
  | NUMBER {
        $$ = strdup($1);
        free($1);
    }
;

%%

int main() {
    return yyparse();
}

%{
#include <stdio.h>
%}

KEYWORD auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typeof|union|unsigned|void|volatile|while
IDENTIFIER [_a-zA-Z][_a-zA-Z0-9]*

%%

{KEYWORD} {
    printf("<%s, %s>\n", yytext, yytext);
}
{IDENTIFIER} {
    printf("<identifier, %s>\n", yytext);
}

%%

int main() {
    yylex();
    return 0;
}

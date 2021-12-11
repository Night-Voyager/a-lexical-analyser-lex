%{
#include <stdio.h>
%}

keyword     auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typeof|union|unsigned|void|volatile|while
identifier  [_a-zA-Z][_a-zA-Z0-9]*

%%

{keyword} {
    printf("<%s, %s>\n", yytext, yytext);
}
{identifier} {
    printf("<identifier, %s>\n", yytext);
}

%%

int main() {
    yylex();
    return 0;
}

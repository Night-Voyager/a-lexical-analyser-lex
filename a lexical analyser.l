%{
#include <stdio.h>
%}

KEYWORD auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typeof|union|unsigned|void|volatile|while

%%

{KEYWORD} {
    printf("<%s, %s>\n", yytext, yytext);
}

%%

int main() {
    yylex();
    return 0;
}

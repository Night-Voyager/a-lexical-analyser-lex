%{
#include <stdio.h>
%}

keyword         auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typeof|union|unsigned|void|volatile|while
identifier      [_a-zA-Z][_a-zA-Z0-9]*
octal_int       0[0-7]+
decimal_int     (0|[1-9][0-9]*)(u|U|l|L|ul|UL)?
hexadecimal_int 0x[0-9a-fA-F]*
float           [0-9]*(\.[0-9]*)?([eE][\+\-]?[0-9]+)?
space           [ \f\r\t\n]
single_line_comment \/\/.*
multi-line_comment  \/\*(.|\n)*\*\/

%%

{keyword} {
    printf("<%s, %s>\n", yytext, yytext);
}
{identifier} {
    printf("<identifier, %s>\n", yytext);
}
{octal_int} {
    printf("<octal_int, %s>\n", yytext);
}
{decimal_int} {
    printf("<decimal_int, %s>\n", yytext);
}
{hexadecimal_int} {
    printf("<hexadecimal_int, %s>\n", yytext);
}
{float} {
    printf("<float, %s>\n", yytext);
}
{space} { /*do nothing*/ }
{single_line_comment} { /*do nothing*/ }
{multi-line_comment} { /*do nothing*/ }

%%

int main() {
    yylex();
    return 0;
}

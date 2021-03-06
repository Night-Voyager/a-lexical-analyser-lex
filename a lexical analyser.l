%{
#include <stdio.h>
%}

%option yylineno

keyword             auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typeof|union|unsigned|void|volatile|while|_Bool|_Complex|_Imaginary|inline|restrict|_Alignas|_Alignof|_Atomic|_Generic|_Noreturn|_Static_assert|_Thread_local
identifier          [_a-zA-Z][_a-zA-Z0-9]*
preprocessor        #define|#elif|#else|#endif|#error|#if|#ifdef|#ifndef|#include|#pragma|#undef
standard_library    <assert\.h>|<ctype\.h>|<errno\.h>|<float\.h>|<limits\.h>|<locale\.h>|<math\.h>|<setjmp\.h>|<signal\.h>|<stdarg\.h>|<stddef\.h>|<stdio\.h>|<stdlib\.h>|<string\.h>|<time\.h>
octal_int           0[0-7]+(u|U|l|L|ul|UL)?
decimal_int         [0-9]*(u|U|l|L|ul|UL)?
hexadecimal_int     0[xX][0-9a-fA-F]*(u|U|l|L|ul|UL)?
float               [0-9]*(\.[0-9]*)?([eE][\+\-]?[0-9]+)?(l|L)?
char                '\\?.'
string              \"[^"\n]*\"
operator            \+|-|\*|\/|%|\+\+|--|==|!=|>|<|>=|<=|&&|\|\||!|&|\||\^|~|<<|>>|=|\+=|-=|\*=|\/=|%=|<<=|>>=|&=|\^=|\|=|\?
delimiter           ,|;|:|\(|\)|\[|\]|\{|\}
punctuation         #|\$|@|`|\.\.\.
space               [ \f\r\t\n]
single_line_comment \/\/.*
multi-line_comment  \/\*(.|\n)*\*\/
empty_char          ''
else                .

%%

{keyword} {
    printf("<%s, %s>\n", yytext, yytext);
}
{identifier} {
    printf("<identifier, %s>\n", yytext);
}
{preprocessor} {
    printf("<preprocessor_directive, %s>\n", yytext);
}
{standard_library} {
    printf("<standard_library, %s>\n", yytext);
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
{char} {
    printf("<char, %s>\n", yytext);
}
{string} {
    printf("<string, %s>\n", yytext);
}
{operator} {
    printf("<operator, %s >\n", yytext);
}
{delimiter} {
    printf("<delimiter, %s >\n", yytext);
}
{punctuation} {
    printf("<punctuation, %s >\n", yytext);
}
{space} |
{single_line_comment} |
{multi-line_comment} { /*do nothing*/ }
{empty_char} |
{else} {
    printf("line %d: unidentified token: %s\n", yylineno, yytext);
}

%%

int main() {
    yylex();
    return 0;
}

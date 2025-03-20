%option noyywrap
%{
	#include<stdio.h>
#include <ctype.h>
%}

%%
"main"              { printf("Funcion principal: 'MAIN' encontrada\n"); }
"printf"            { printf("Funcion: 'PRINTF' encontrada\n"); }
"scanf"             { printf("Funcion: 'SCANF' encontrada\n"); }

"auto"              { printf("Palabra 'AUTO' encontrada\n"); }
"break"             { printf("Palabra 'BREAK' encontrada\n"); }
"case"              { printf("Palabra 'CASE' encontrada\n"); }
"const"             { printf("Palabra 'CONST' encontrada\n"); }
"continue"          { printf("Palabra 'CONTINUE' encontrada\n"); }
"default"           { printf("Palabra 'DEFAULT' encontrada\n"); }
"do"                { printf("Palabra 'DO' encontrada\n"); }
"else"              { printf("Palabra 'ELSE' encontrada\n"); }
"enum"              { printf("Palabra 'ENUM' encontrada\n"); }
"extern"            { printf("Palabra 'EXTERN' encontrada\n"); }
"for"               { printf("Palabra 'FOR' encontrada\n"); }
"goto"              { printf("Palabra 'GOTO' encontrada\n"); }
"if"                { printf("Palabra 'IF' encontrada\n"); }
"register"          { printf("Palabra 'REGISTER' encontrada\n"); }
"return"            { printf("Palabra 'RETURN' encontrada\n"); }
"signed"            { printf("Palabra 'SIGNED' encontrada\n"); }
"sizeof"            { printf("Palabra 'SIZEOF' encontrada\n"); }
"static"            { printf("Palabra 'STATIC' encontrada\n"); }
"struct"            { printf("Palabra 'STRUCT' encontrada\n"); }
"switch"            { printf("Palabra 'SWITCH' encontrada\n"); }
"typedef"           { printf("Palabra 'TYPEDEF' encontrada\n"); }
"union"             { printf("Palabra 'UNION' encontrada\n"); }
"unsigned"          { printf("Palabra 'UNSIGNED' encontrada\n"); }
"volatile"          { printf("Palabra 'VOLATILE' encontrada\n"); }
"while"             { printf("Palabra 'WHILE' encontrda\n"); }

"char"              { printf("Tipo de dato 'CHAR' encontrado\n"); }
"double"            { printf("Tipo de dato 'DOUBLE' encontrado\n"); }
"float"             { printf("Tipo de dato 'FLOAT' encontrado\n"); }
"int"               { printf("Tipo de dato 'INT' encontrado\n"); }
"long"              { printf("Tipo de dato 'LONG' encontrado\n"); }
"short"             { printf("Tipo de dato 'SHORT' encontrado\n"); }
"void"              { printf("Tipo de dato 'VOID' encontrado\n"); }

[a-z][a-z0-9A-Z]*   { printf("Variable: %s\n", yytext); }
%%
int main(int txt, char *argv[]) {
    if (txt > 1) {
		printf("\nPalabras reservadas y variables en lenguaje C encontradas:\n\n");
        FILE *input = fopen(argv[1], "r");
        if (input == NULL) {
            fprintf(stderr, "No se pudo abrir el archivo, verifique que este en la misma carpeta del ejecutable %s\n", argv[1]);
            return 1;
        }

        yyin = input;

        yylex();  

    }
    fclose(yyin);
	return 0;
}
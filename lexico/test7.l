%option noyywrap
%{
	#include <stdio.h> 
	#include <ctype.h>
%}

%%
.  { putchar(tolower(yytext[0])); }  
%%

int main(int txt, char *argv[]) {
    
    if (txt > 1) {
        FILE *input = fopen(argv[1], "r");
        if (input == NULL) {
            printf("No se pudo abrir el archivo, verifique que este en la misma carpeta del ejecutable %s\n", argv[1]);
            return 1;
        }

        
        yyin = input;
    }

    // Llama al analizador léxico
    yylex();

    return 0;
}

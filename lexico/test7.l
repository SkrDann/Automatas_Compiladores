%option noyywrap
%{
	#include <stdio.h> 
	#include <ctype.h>
%}

%%
.  { putchar(yytext[0]); }  

%%

int main(int txt, char *argv[]) {
    
    if (txt > 1) {
		 printf("\nTexto Original:\n");
        FILE *input = fopen(argv[1], "r");
        if (input == NULL) {
            printf("No se pudo abrir el archivo, verifique que este en la misma carpeta del ejecutable %s\n", argv[1]);
            return 1;
        }

        
        yyin = input;
    }
    yylex();

	if (txt > 1) {
		printf("\n\nTexto convertido a minusculas:\n");
        FILE *input = fopen(argv[1], "r");
        if (input == NULL) {
            printf("No se pudo abrir el archivo, verifique que este en la misma carpeta del ejecutable %s\n", argv[1]);
            return 1;
        }

        
        yyin  = input;
	while ((yytext[0] = fgetc(yyin)) != EOF) {  
            putchar(tolower(yytext[0]));  

    }
    
    }
    yylex();
    fclose(yyin);

    return 0;
}

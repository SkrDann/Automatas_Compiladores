%option noyywrap
%{
	#include <stdio.h>
	#include <ctype.h>
%}

%%
.  {  }
aplicar        { printf("Verbo 'APLICAR' encontrado\n"); }
clasificar     { printf("Verbo 'CLASIFICAR' encontrado\n"); }
completar      { printf("Verbo 'COMPLETAR' encontrado\n"); }
construir      { printf("Verbo 'CONSTRUIR' encontrado\n"); }
demostrar      { printf("Verbo 'DEMOSTRAR' encontrado\n"); }
dibujar        { printf("Verbo 'DIBUJAR' encontrado\n"); }
ejecutar       { printf("Verbo 'EJECUTAR' encontrado\n"); }
emplear        { printf("Verbo 'EMPLEAR' encontrado\n"); }
esbozar        { printf("Verbo 'ESBOZAR' encontrado\n"); }
examinar       { printf("Verbo 'EXAMINAR' encontrado\n"); }
experimentar   { printf("Verbo 'EXPERIMENTAR' encontrado\n"); }
ilustrar       { printf("Verbo 'ILUSTRAR' encontrado\n"); }
interpretar    { printf("Verbo 'INTERPRETAR' encontrado\n"); }
mostrar        { printf("Verbo 'MOSTRAR' encontrado\n"); }
operar         { printf("Verbo 'OPERAR' encontrado\n"); }
planear        { printf("Verbo 'PLANEAR' encontrado\n"); }
programar      { printf("Verbo 'PROGRAMAR' encontrado\n"); }
trazar         { printf("Verbo 'TRAZAR' encontrado\n"); }
usar           { printf("Verbo 'USAR' encontrado\n"); }
utilizar       { printf("Verbo 'UTILIZAR' encontrado\n"); }
practicar      { printf("Verbo 'PRACTICAR' encontrado\n"); }
implementar    { printf("Verbo 'IMPLEMENTAR' encontrado\n"); }
realizar       { printf("Verbo 'REALIZAR' encontrado\n"); }
resolver       { printf("Verbo 'RESOLVER' encontrado\n"); }


%%

int main(int txt, char *argv[]) {
    if (txt > 1) {
		printf("\nVerbos encontrados:\n");
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

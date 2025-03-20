%option noyywrap

%{
#include <stdio.h>
%}

%x COMENTARIO

%%

"//".*           { printf("Comentario %s\n", yytext); }

"/*"                    {  printf("Comentario Multilineal /*\n");
                           BEGIN(COMENTARIO); }

<COMENTARIO> {
    "*/"               {  printf("Fin de comentario multilineal */\n"); 
			   BEGIN(INITIAL); }
    (.|"\n")              {  printf("%s", yytext); }
}

\"([^\"\n\\]|\\.)*\"    { printf("Cadena de texto: %s\n", yytext); }



[a-zA-Z]+  { printf("Palabra: %s\n", yytext); }

[ \t\n]+               {  }
.		       {  }
%%
int main(int txt, char *argv[]) {
    if (txt > 1) {
		printf("\nComentarios y texto que se presenta en pantalla de acuerdo con la sintaxis del lenguaje de programación C: \n\n");
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
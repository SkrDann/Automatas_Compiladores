%{
	#include<stdio.h>
	int lex ();
	 int yyerror(const char *s) {
        fprintf(stderr, "Error: %s\n", s);
	 yyrestart(stdin);
        return 0;
    }
%}

%% 

%token NUM POR EOL ;
%start statements;


statements : expression EOL { printf("RESULTADO = %d\n", $1); }
| error EOL { yyerror("Entrada incorrecta");  yyrestart(stdin); } // Si hay un error, mostramos el mensaje

expression : NUM	{ $$ = $1; printf("numero: %d\n", $$);}
           |
	   | NUM POR NUM { $$ = $1 * $3; printf("MULTIPLICACION *: %d\n", $$);}
	   



%%

int main () {
printf("Ingrese su numero o numeros...\n");
yyparse();
 yyrestart(stdin);
return 1;
}
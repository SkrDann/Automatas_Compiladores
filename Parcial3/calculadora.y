%{
	#include<stdio.h>
	int lex ();
	 int yyerror(const char *s) {
        fprintf(stderr, "Error: %s\n", s);
        return 0;
    }
%}

%% 

%token NUM MAS MEN DIV POR EOL ;
%start statements;


statements : expression EOL { printf("RESULTADO = %d\n", $1);}

expression : NUM	{ $$ = $1; printf("numero: %d\n", $$);}
           | NUM MAS NUM { $$ = $1 + $3; printf("SUMA +: %d\n", $$);}
	   | NUM MEN NUM { $$ = $1 - $3; printf("RESTA -: %d\n", $$);}
	   | NUM POR NUM { $$ = $1 * $3; printf("MULTIPLICACION *: %d\n", $$);}
	   | NUM DIV NUM { $$ = $1 / $3; printf("DIVISION /: %d\n", $$);}




%%

int main () {
printf("Ingrese su numero o numeros...\n");
yyparse();
return 1;
}
%option noyywrap
%{
	#include<stdio.h>
	#define NUMEROS_ENTEROS 1
	
%}

%%
[+-]?[0-9]+ {return NUMEROS_ENTEROS; }
%%
int main()
{
	int token;
	while(1){
	token = yylex();
	if ( token == NUMEROS_ENTEROS ){
	      printf("  token NUMEROS_ENTEROS reconocido\n");}


	if ( token == 0 )
	    break;
	}
	return 0;
}
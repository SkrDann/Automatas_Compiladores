%option noyywrap
%{
	#include<stdio.h>
	#define NUMEROS_DECIMALES 1
%}

%%
[+-]?[0-9]+([.][0-9]+)? {return NUMEROS_DECIMALES; }
%%
int main()
{
int token;
	while(1){
	token = yylex();
	if ( token == NUMEROS_DECIMALES ){
	      printf("  token NUMEROS_DECIMALES reconocido\n");}


	if ( token == 0 )
	    break;
	}
	return 0;
}
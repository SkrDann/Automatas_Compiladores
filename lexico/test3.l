%option noyywrap
%{
	#include<stdio.h>
	#define VARIABLE 1
%}

%%
[a-z]([0-9]{2}) {return VARIABLE; }
%%

int main()
{
int token;
	while(1){
	token = yylex();
	if ( token == VARIABLE ){
	      printf("  token VARIABLE reconocido\n");}


	if ( token == 0 )
	    break;
	}
	return 0;
}
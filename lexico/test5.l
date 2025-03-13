%option noyywrap
%{
	#include<stdio.h>
	#define CURP 1
%}

%%
[A-Z]{4}[0-9]{2}([0]+[1-9]{1}|1[0-2])([0]+[1-9]{1}|1[0-9]|2[0-9]|3[0-1])(H|M)[A-Z]{5}[A-Z0-9]{2} {return CURP; }
%%
int main()
{
int token;
	while(1){
	token = yylex();
	if ( token == CURP ){
	      printf("  token CURP reconocido\n");}


	if ( token == 0 )
	    break;
	}
	return 0;
}
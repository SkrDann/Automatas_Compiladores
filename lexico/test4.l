%option noyywrap
%{
	#include<stdio.h>
	#define RFC 1
%}

%%
[A-Z]{4}[0-9]{2}([0]+[1-9]{1}|1[0-2])([0]+[1-9]{1}|1[1-9]|2[1-9]|3[0-1])[0-9A-Z]{3} {return RFC; }
%%
int main()
{
int token;
	while(1){
	token = yylex();
	if ( token == RFC ){
	      printf("  token RFC reconocido\n");}


	if ( token == 0 )
	    break;
	}
	return 0;
}
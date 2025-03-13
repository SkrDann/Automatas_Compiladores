%option noyywrap
%{
	#include<stdio.h>
	#define EMAIL_INSTITUCIONAL 1
%}

%%
[a-z]{2}[0-9]{6}[@](uaeh)[.](edu)[.](mx) {return EMAIL_INSTITUCIONAL; }
%%
int main()
{
int token;
	while(1){
	token = yylex();
	if ( token == EMAIL_INSTITUCIONAL ){
	      printf("  token EMAIL_INSTITUCIONAL reconocido\n");}


	if ( token == 0 )
	    break;
	}
	return 0;
}

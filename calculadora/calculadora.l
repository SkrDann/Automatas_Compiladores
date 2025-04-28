
%{
	#include<stdio.h>
	#include "y.tab.h"
	extern int yylval;

%}

%%
[0-9]+ { yylval =atoi(yytext);return NUM; }
"+"    { return MAS;}
"-" { return MEN;}
"*" { return POR;}
"/" { return DIV;}
\n { return EOL;}
[ \t\r] {}


%%
int yywrap(void){ return 1;}

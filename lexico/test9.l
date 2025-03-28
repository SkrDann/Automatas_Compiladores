%option noyywrap
%{
	#include <stdio.h>
	#include <string.h>
	#include <ctype.h>
%}

%%
.  {  }

analizar|calcular|catalogar|categorizar|comparar|contrastar|criticar|cuestionar|debatir|diagramar|diferenciar|discriminar|discutir|distinguir|examinar|experimentar|explicar|identificar|inspeccionar|investigar|lograr|organizar|probar|relatar|resolver {
    printf("Verbo de la taxonomia de Bloom categor�a de Analisis: %s\n", yytext);
}

competente|constante|contento|cordial|decidido|detallista|dialogante|diligente|discreto|divertido|educado|eficaz|eficiente|emprendedor|encantador|ingenioso|inteligente|interesante|justo|leal|listo|l�gico|maravilloso|met�dico|minucioso|modesto|motivador|negociador|notable|objetivo|ordenado|orientado|extraordinario|fant�stico|feliz|flexible|generoso|genial|h�bil|honesto|hermoso|honrado|idealista|independiente|persuasivo|positivo|responsable|sabio|trabajador {
    printf("Adjetivos positivos: %s\n", yytext);
}


y|e|ni|tambi�n|o|u|pero|sino|excepto|salvo|menos|pues|as�|adem�s|como|aunque|porque {
    printf("Conjunciones: %s\n", yytext);
}


a|ante|bajo|cabe|con|contra|de|desde|durante|en|entre|hacia|hasta|mediante|para|por|segun|sin|sobre|tras|via {
    printf("Preposiciones: %s\n", yytext);
}

yo|tu|usted|el|ella|nosotros|ustedes|ellos|ellas|me|te|lo|la|nos|los|las|se|les {
    printf("Pronombre: %s\n", yytext);
}


%%

int main(int txt, char *argv[]) {
    if (txt > 1) {
		printf("\nVerbos, Adjetivos, Conjunciones, Preposiciones y Pronombres encontrados:\n");
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

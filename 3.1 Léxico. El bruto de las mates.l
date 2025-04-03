%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int cont_lineas = 0;
int cont_palabras = 0;
int cont_caract = 0;
int cont_digit = 0;
int empi_ni = 0;
int b_to = 0;
int termi_jo = 0;
int total_num = 0;
int empi_num = 0; // Contador para las palabras que empiezan con "N\xFAm"
%}

%%

\n          { cont_lineas++; }
[0-9]+      { cont_digit += yyleng; total_num++;cont_caract+= yyleng; }
ni[a-zA-Z\xE1\xE9\xED\xF3\xFA\xC1\xC9\xCD\xD3\xDA\xF1\xD1]* { empi_ni++;cont_caract+= yyleng; }
b[a-zA-Z\xE1\xE9\xED\xF3\xFA\xC1\xC9\xCD\xD3\xDA\xF1\xD1]*to { b_to++; cont_caract+= yyleng;}
n[\xFA]m[a-zA-Z]* { empi_num++; cont_caract += yyleng;} // Contamos palabras que empiezan con "Núm"
[a-zA-Z\xE1\xE9\xED\xF3\xFA\xC1\xC9\xCD\xD3\xDA\xF1\xD1]+jo { termi_jo++;cont_caract+= yyleng; }
[a-zA-Z\xE1\xE9\xED\xF3\xFA\xC1\xC9\xCD\xD3\xDA\xF1\xD1]+   { cont_palabras++; cont_caract+= yyleng;}
.          { cont_caract++;  }  // Contamos todos los caracteres (incluyendo letras y símbolos)
[ ][ \t\r]    { cont_caract += yyleng; }  // Contamos espacios, tabuladores y retornos de carro


%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Uso: %s <archivo.txt>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("No se puede abrir el archivo %s\n", argv[1]);
        return 1;
    }

    yyin = file;
    yylex();  // Procesa el archivo

    printf("Total de lineas: %d\n", cont_lineas );
    printf("Total de palabras: %d\n", (cont_palabras+total_num+empi_ni+ b_to+termi_jo));
    printf("Total de caracteres: %d\n", cont_caract);
    printf("Total de numeros: %d\n", total_num);
    printf("Palabras que empiezan con 'ni': %d\n", empi_ni);
    printf("Palabras que empiezan con 'b' y terminan con 'to': %d\n", b_to);
    printf("Palabras que terminan con 'jo': %d\n", termi_jo);
    printf("Total de digitos: %d\n", cont_digit);
     printf("Palabras que empiezan con 'N\xFAm': %d\n", empi_num); // Imprimimos el contador de palabras que empiezan con "Núm"

    fclose(file);
    return 0;
}

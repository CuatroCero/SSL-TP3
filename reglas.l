%{
#include <stdio.h>
#include "tokens.h"
%}
letra [a-zA-Z]
digito [0-9]
operador [-+*/]
puntuacion [;,()]
invalido [^ \na-zA-Z0-9;,()+*/-]
%%	
programa 									return PROGRAMA;
leer 										return LEER;
"escribir"									return ESCRIBIR;
"variables"									return VARIABLES;
"codigo"									return CODIGO;
"fin"										return FIN;
"definir"									return DEFINIR;
{letra}({letra}|{digito})*					return IDENTIFICADOR;
{puntuacion}								return SGOPUNTUACION;
:=											return ASIGNACION;
{operador}									return OPERADORES;
{digito}+									return CONSTANTE;

"/""/".*			;
.|\n    			;
{digito}+{letra}+							printf("Error léxico: constante con sufijo inválido: %s\n",yytext);
{letra}({letra}|{digito})*{invalido}+		printf("Error léxico: identificador invalido: %s\n",yytext);
{invalido}+									printf("Error léxico: cadena desconocida: %s\n",yytext);
<<EOF>>							return EOF;

%%
char *token_names[] = {"FDT", "PROGRAMA", "VARIABLES", "OPERADORES", "ASIGNACION", "DEFINIR", "CODIGO", "IDENTIFICADOR", "LEER", "ESCRIBIR", "FIN", "SGOPUNTUACION", "CONSTANTE"};
int main() {
	enum token t;
	while ((t = yylex()) != EOF){
		if (t==IDENTIFICADOR || t== CONSTANTE) printf("Token: %s\t\tLexema: %s\n", token_names[t], yytext);
		else if (t==SGOPUNTUACION || t== OPERADORES) printf("Token: '%s'\n", yytext);
		else printf("Token: %s\n", token_names[t]);
	}
	printf("Token: Fin de Archivo\n");
	return 0;
}

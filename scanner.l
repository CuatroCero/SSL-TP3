%{
	#include "tokens.h"
	int palabraReservada = 0;
	int sgoPuntuacion = 0;
	int identificador = 0;
	int operadores = 0;
	int constanteEntera = 0;
	int asignacion = 0;
%}

%%
	"programa" 							{return PROGRAMA; 		palabraReservada++;};
	"variables"							{return VARIABLES;		palabraReservada++;};
	"definir"							{return DEFINIR;			palabraReservada++;};
	"codigo"							{return CODIGO;			palabraReservada++;};
	"leer"								{return LEER;			palabraReservada++;};
	"fin"								{return FIN;				palabraReservada++;};
	[a-zA-Z][a-zA-Z0-9]*				{return IDENTIFICADOR;	identificador++;};
	"//".*								;
	[0-9]+								{return CONSTANTE;		constanteEntera++;};
	["(" ")" ";" "," "+" "-" "*" "/"]	{return SGOPUNTUACION;	sgoPuntuacion++;};
%%

main()
{
	yylex();
	printf("%8d%8d%8d\n", palabraReservada, identificador, sgoPuntuacion);
}

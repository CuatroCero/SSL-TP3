%{
	int palabraReservada = 0;
	int sgoPuntuacion = 0;
	int identificador = 0;
	int operadores = 0;
	int operadores = 0;
	int constanteEntera = 0;
	int asignacion = 0;
%}

%%
	"programa" 							return PROGRAMA;
	"variables"							return VARIABLES;
	"definir"							return DEFINIR;
	"codigo"							return CODIGO;
	"leer"								return LEER;
	"fin"								return FIN;
	[a-zA-Z][a-zA-Z0-9]*				return IDENTIFICADOR;
	"//".*								;
	[0-9]+								return CONSTANTE;
	["(" ")" ";" "," "+" "-" "*" "/"]	return SGOPUNTUACION;
%%

main()
{
	yylex();
	printf("%8d%8d%8d\n", lines, words, chars);
}

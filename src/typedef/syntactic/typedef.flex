package typedef.syntactic;

%%

%unicode
%line
%column
%cup
%implements Symbols

%{
	private java_cup.runtime.Symbol tok(int kind) {
		return new java_cup.runtime.Symbol(kind, yyline, yycolumn);
	}

	private java_cup.runtime.Symbol tok(int kind, Object value) {
		return new java_cup.runtime.Symbol(kind, yyline, yycolumn, value);
	}
%}

%eofval{
	return tok(EOF, null);
%eofval}

LineTerm = \n|\r|\r\n
Identifier = [a-z]+
Whitespace = {LineTerm}|[ \t\f]

%%

"typedef" { return tok(TYPEDEF); }

"{" { return tok(LBRACE); }
"}" { return tok(RBRACE); }

";" { return tok(SEMI); }

{Identifier} {
	if (ParserTest.isTypeId(yytext())) {
		return tok(TYPEID, yytext());
	} else {
		return tok(ID, yytext());
	}
}
{Whitespace} { /* skip */ }

[^] { throw new RuntimeException("Illegal character " + yytext() + " in line " + (yyline + 1) + ", column " + (yycolumn + 1)); }

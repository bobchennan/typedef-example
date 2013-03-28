package typedef.syntactic;

import typedef.symbol.Symbol;
import typedef.symbol.Table;

public class ParserTest {

	private static Table types = new Table();

	public static void beginScope() {
		types.beginScope();
	}

	public static void endScope() {
		types.endScope();
	}

	public static boolean isTypeId(String s) {
		return types.get(Symbol.symbol(s)) != null;
	}

	public static void addTypeId(String s) {
		types.put(Symbol.symbol(s), s);
	}

	public static void main(String[] args) throws Exception {
		new Parser(new Yylex(ParserTest.class.getResourceAsStream("test.in"))).parse();
	}
}

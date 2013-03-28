all: Parser.java Symbols.java Yylex.java

Parser.java: typedef.cup
	java -jar ../../../lib/java-cup-11a.jar -parser Parser -symbols Symbols -interface < typedef.cup

Symbols.java: typedef.cup
	java -jar ../../../lib/java-cup-11a.jar -parser Parser -symbols Symbols -interface < typedef.cup

Yylex.java: typedef.flex
	java -cp ../../../lib/JFlex.jar JFlex.Main typedef.flex

clean:
	rm -f Parser.java Symbols.java Yylex.java

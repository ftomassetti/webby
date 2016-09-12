lexer grammar WebbyLexer;

// Whitespace
NEWLINE            : '\r\n' | 'r' | '\n' ;
WS                 : [\t ]+ -> skip ;

// Keywords
VAR                : 'var' ;
CONST              : 'const' ;

// Literals
INTLIT             : '0'|[1-9][0-9]* ;
DECLIT             : '0'|[1-9][0-9]* '.' [0-9]+ ;
PATH_STRING        : ('/'[A-Za-z0-9_]*)+ ;
STRLIT             : '\'' (~[\r\n\t'])* '\'' ;

// Operators
PLUS               : '+' ;
MINUS              : '-' ;
ASTERISK           : '*' ;
DIVISION           : '/' ;
ASSIGN             : '=' ;
LPAREN             : '(' ;
RPAREN             : ')' ;
COMMA              : ',' ;
LSQUARE            : '[' ;
RSQUARE            : ']' ;
LBRACKET           : '{' ;
RBRACKET           : '}' ;

METHOD             : 'GET' | 'PUT' | 'POST' | 'DELETE ' ;


// Identifiers
ID                 : [_]*[a-z][A-Za-z0-9_]* ;

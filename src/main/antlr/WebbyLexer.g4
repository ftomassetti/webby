lexer grammar WebbyLexer;

// Whitespace
NEWLINE            : '\r\n' | 'r' | '\n' ;
INDENT             : ('    ')|[\t] ;
WS                 : [ ] -> skip ;

// Keywords
VAR                : 'var' ;
CONST              : 'val' ;
REQUIRED           : 'req' ;
HEADER             : 'header' ;

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
COLON              : ':' ;
REPLY              : 'reply' ;

METHOD             : 'GET' | 'PUT' | 'POST' | 'DELETE ' ;
RESPONSE_TYPE      : 'OK'
                   | 'CREATED'
                   | 'ACCEPTED'
                   | 'BADREQUEST'
                   | 'UNAUTHORIZED'
                   | 'FORBIDDEN'
                   | 'NOTFOUND'
                   ;


// Identifiers
ID                 : [_]*[a-z][A-Za-z0-9_]* ;

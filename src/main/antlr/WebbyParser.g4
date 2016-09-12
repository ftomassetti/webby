parser grammar WebbyParser;

options { tokenVocab=WebbyLexer; }

webbyFile : elements=topLevelElement+ EOF
          ;

topLevelElement : constant
                | variable
                | route
                ;

constant : CONST name=ID ASSIGN value=expression
         ;

variable : VAR name=ID ASSIGN value=expression
         ;

route : METHOD path LBRACKET RBRACKET
      ;

path : PATH_STRING
     ;

namedMapLiteral : LBRACKET (entries+=namedMapLiteralEntry ((COMMA | NEWLINE) entries+=namedMapLiteralEntry)* )? RBRACKET
                ;

namedMapLiteralEntry : name=ID ASSIGN value=expression
                     ;

listLiteral : LSQUARE (values+=expression ((COMMA | NEWLINE) values+=expression)* )? RSQUARE
            ;

expression : left=expression operator=(DIVISION|ASTERISK) right=expression # binaryOperation
           | left=expression operator=(PLUS|MINUS) right=expression        # binaryOperation
           | LPAREN expression RPAREN # parenExpression
           | ID                #varReference
           | MINUS expression  #minusExpression
           | namedMapLiteral #namedMapLiteralExpression
           | listLiteral # listLiteralExpression
           | STRLIT # stringLiteral
           | INTLIT # intLiteral
           | DECLIT # decimalLiteral ;

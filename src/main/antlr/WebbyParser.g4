parser grammar WebbyParser;

options { tokenVocab=WebbyLexer; }

webbyFile : (elements=topLevelElement)* EOF
          ;

newlines : NEWLINE+
         ;

topLevelElement : constant
                | variable
                | route
                ;

constant : CONST name=ID ASSIGN value=expression
         ;

variable : VAR name=ID ASSIGN value=expression
         ;

route : METHOD path COLON newlines (lines+=routeLine)+
      ;

routeLine : INDENT statement newlines;

path : PATH_STRING
     ;

statement : expression
          | reply
          | constant
          | variable
          ;

reply : REPLY RESPONSE_TYPE value=expression
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
           | (REQUIRED)? HEADER name=ID # headerExpression
           | STRLIT # stringLiteral
           | INTLIT # intLiteral
           | DECLIT # decimalLiteral ;

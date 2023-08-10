%option main

/*  */
/*  */
/*  */
/*  */
/*  */
/*  */

/* */

space                           [ ]
ws                              [ ]*

letter                  		[a-zA-Z]
digit                   		[0-9]
sign 							[+-]

/* Key words (daha iyi bir isim ?) */

if                              if
for							    for
while                           while
if								if
else_if							else_if
else 							else
set								set_type
return							retudn
print							print
int				      			int
boolean				      		boolean
double				      		double
char							char_type
main							main
function                        function

/* ??? */

rp                              (								
lp                              )								
rb                              {								
lb                              }								
assign                          = 								

/* Relations */

add                             +				       	       	
min                             -				       	       
mul                             *							
div                             /							
mod                             %							
eq                              ==					       	
not_eq                          !=					       	
samller                         <									
smaller_or_eq                   <=							
bigger                          >									
bigger_or_eq                    >=								
mul_assign                      *=							
div_assign                      /=							
add_assgin                      +=							
min_assign                      -=	 						
logical_and                     &&							
logical_or                      ||							
not                             !								

/* Primitive Functions */

/* pow olur mu nasıl olur (^^ | **) ? */

pow                             **
union                           u
intersection                    n
difference                      \
cartesian_product               x
pop                             (<< || pop)
push                            (>> || push)
max                             max
min                             min
average                         avg
conatins                        contains   
file_in                         (<<< | file_out)
file_out                        (>>> | file_in)
cardinality                     (cardinality | \|\|)
display                         display
singelton                       singelton
copy                            copy
filter                          filter
subset                          subset
superset                        superset

/* Literals */

int_literal             		{sign}?{digit}+
double_literal          		{sign}?{digit}+(\.){digit}+
string_literal          		\"[^\"]*\"
char_literal					'[^']?'
boolean_literal         		(TRUE|FALSE)

/* Other (???)*/

/* ??? */

line_comment					\#\#.*
multi_comment					\#\?([\?]|\?|[^?])*\?\#
comment							({line_comment}|{multi_comment})

type                            ({int}, {double} {char}, {boolean} {string})

/* Buna gerek kalıyor mu yacc da yapıyorsak ? */

return_type						\#(int|void|string|char|set|boolean|double) 

alphanumeric 					({letter}|{digit})

/* Set */

set_element						({int_literal}|{double_literal}|{string_literal}|{char_literal}|{boolean_literal}|({letter}{alphanumeric}*))
set_content						\{{space}?(({set_element}{space}?\,)*{space}?{set_element})?{space}?\}

set_identifier	                \&{letter}{alphanumeric}*

%%

\(								printf("LP ");
\)								printf("RP ");
\{								printf("LB ");
\}								printf("RB ");
\= 								printf("ASSIGNMENT ");
\+				       	        printf("PLUS ");	
\-				       	        printf("MINUS ");
\*								printf("MULTIPLICATION ");
\/								printf("DIVISION ");
\%								printf("MODULO");
\=\=					        printf("EQUALITY ");	
\!\=					        printf("NOT_EQUAL ");	
\<								printf("LESS_THAN ");	
\<\=							printf("LESS_THAN_EQUAL ");	
\>								printf("GREATER_THAN ");	
\>\=							printf("GREATER_THAN_EQUAL ");	
\*\=							printf("ASSIGNMENT_WITH_MULTIP ");
\/\=							printf("ASSIGNMENT_WITH_DIVISION ");
\+\=							printf("ASSIGNMENT_WITH_ADDITION ");
\-\=							printf("ASSIGNMENT_WITH_SUBTRACTION ");
\&\&							printf("AND ");
\|\|							printf("OR ");
\!								printf("NOT ");
\.								printf("DOT ");
\,								printf("COMMA ");
\; 								printf("SC");
for								printf("FOR ");
while							printf("WHILE ");
if								printf("IF ");
else_if							printf("ELSE_IF ");
else 							printf("ELSE ");
set								printf("SET_TYPE ");
return							printf("RETURN ");
print							printf("PRINT ");
int				      			printf("INT_TYPE ");
boolean				      		printf("BOOLEAN_TYPE ");
double				      		printf("DOUBLE_TYPE ");
char							printf("CHAR_TYPE ");
main							printf("MAIN " );
{string_literal} 				printf("STRING_LITERAL ");
{int_literal}           		printf("INT_LITERAL ");
{double_literal}        		printf("DOUBLE_LITERAL ");
{boolean_literal}				printf("BOOLEAN_LITERAL ");
{char_literal}					printf("CHAR_LITERAL ");
{letter}{alphanumeric}*			printf("IDENTIFIER ");
\&{letter}{alphanumeric}*		printf("IDENTIFIER_SET ");
{comment}						printf("COMMENT ");
{return_type}					printf("RETURN_TYPE ");
[ \t\n]                         ;

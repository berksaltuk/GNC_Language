%option main
space                               [ ]
ws                                  {space}*
letter                  		    [a-zA-Z]
digit                   		    [0-9]
alphanumeric 					    ({letter}|{digit})
identifier						    {letter}{alphanumeric}*	    
sign 							    [+-]
int_literal             		    {sign}?{digit}+
double_literal          		    {sign}?{digit}+(\.){digit}+
string_literal          		    \"[^\"]*\"
char_literal					    '[^']?'
boolean_literal         		    (true|false)
line_comment					    \#\#.*
multi_comment					    \#\?([\?]|\?|[^?])*\?\#
comment							    ({line_comment}|{multi_comment})
set_element						    ({int_literal}|{double_literal}|{string_literal}|{char_literal}|{boolean_literal}|({letter}{alphanumeric}*))
set_content						    \{(({ws}{set_element}{ws}\,)*{ws}{set_element})?{ws}\}
newline                   \n
%%

\(								    printf("LP ");
\)								    printf("RP ");
\{								    printf("LB ");
\}								    printf("RB ");
\= 								    printf("ASSIGNMENT ");
\+				       	            printf("PLUS ");	
\-				       	            printf("MINUS ");
\*								    printf("MULTIPLICATION ");
\/								    printf("DIVISION ");
\%								    printf("MODULO ");
\=\=					            printf("EQUALITY ");	
\!\=					            printf("NOT_EQUAL ");	
\<								    printf("LESS_THAN ");	
\<\=							    printf("LESS_THAN_EQUAL ");	
\>								    printf("GREATER_THAN ");	
\>\=							    printf("GREATER_THAN_EQUAL ");	
\*\=							    printf("ASSIGNMENT_WITH_MULTIP ");
\/\=							    printf("ASSIGNMENT_WITH_DIVISION ");
\+\=							    printf("ASSIGNMENT_WITH_ADDITION ");
\-\=							    printf("ASSIGNMENT_WITH_SUBTRACTION ");

\&\&							    printf("AND ");
\|\|							    printf("OR ");
\!								    printf("NOT ");

\*u								    printf("UNION ");
\*n								    printf("INTERSECTION ");
\*\							        printf("SET_DIFF ");
\*x								    printf("CARTESIAN_PRODUCT ");

\*\=\=							    printf("EQUAL_SET ");
\*\=\=\=						    printf("EQUIVALENT_SET ");

\*\>						        printf("SUPERSET ");
\*\<                                printf("SUBSET ");
\*\*\<                              printf("PROPER_SUBSET ");

input                               printf("INPUT_FUNCTION");   
display                             printf("DISPLAY_FUNCTION ");

push                                printf("PUSH_FUNCTION ");
pop                                 printf("POP_FUNCTION ");
remove                              printf("REMOVE_FUNCTION ");

is_singleton                        printf("IS_SINGLETON_FUNCTION ");
is_empty                            printf("IS_EMPTY_FUNCTION ");
cardinality						    printf("CARDINALITY_FUNCTION ");
filter                              printf("FILTER_FUNCTION ");
contains						    printf("CONTAINS_FUNCTION ");
copy                                printf("COPY_FUNCTION ");

overlapping				            printf("OVERLAPPING_FUNCTION ");
disjoint						    printf("DISJOINT_FUNCTION ");

delete                              printf("DELETE_FUNCTION ");

\<\<\<                              printf("FILE_IN_FUNCTION ");
\>\>\>                              printf("FILE_OUT_FUNCTION ");

\.								    printf("DOT ");
\,								    printf("COMMA ");
\; 								    printf("SC ");
\:                                  printf("COLON ");

{set_content}					    printf("SET_CONTENT ");
for		                            printf("FOR ");
foreach						        printf("FOR_EACH");
while							    printf("WHILE ");
if								    printf("IF ");
else_if							    printf("ELSE_IF ");
else 							    printf("ELSE ");

return							    printf("RETURN ");
print							    printf("PRINT ");

boolean				      		    printf("BOOLEAN_TYPE ");
string				      			    printf("STRING_TYPE ");
double				      		    printf("DOUBLE_TYPE ");
int				      			    printf("INT_TYPE ");
char							    printf("CHAR_TYPE ");
set								    printf("SET_TYPE ");
void								printf("VOID_TYPE ");

main							    printf("MAIN ");
function						    printf("FUNCTION ");

{string_literal} 				    printf("STRING_LITERAL ");
{int_literal}           		    printf("INT_LITERAL ");
{double_literal}        		    printf("DOUBLE_LITERAL ");
{boolean_literal}				    printf("BOOLEAN_LITERAL ");
{char_literal}					    printf("CHAR_LITERAL ");
{identifier}					    printf("IDENTIFIER ");
\*{identifier}					    printf("IDENTIFIER_SET ");
\?{identifier}				        printf("FUNCTION_NAME ");
{comment}						    printf("COMMENT ");

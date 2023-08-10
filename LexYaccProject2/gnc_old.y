%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char* s);
extern int yylineno;
%}

%token LP RP LB RB ASSIGNMENT PLUS MINUS MULTIPLICATION DIVISION 
MODULO EQUALITY NOT_EQUAL LESS_THAN
LESS_THAN_EQUAL GREATER_THAN GREATER_THAN_EQUAL 
ASSIGNMENT_WITH_MULTIP ASSIGNMENT_WITH_DIVISION
ASSIGNMENT_WITH_ADDITION ASSIGNMENT_WITH_SUBTRACTION
AND OR NOT UNION INTERSECTION SET_DIFF CARTESIAN_PRODUCT 
EQUAL_SET EQUIVALENT_SET SUPERSET SUBSET PROPER_SUBSET 
INPUT_FUNCTION DISPLAY_FUNCTION ADD_FUNCTION RANDOM_REMOVE_FUNCTION
REMOVE_FUNCTION IS_SINGLETON_FUNCTION IS_EMPTY_FUNCTION
CARDINALITY_FUNCTION FILTER_FUNCTION CONTAINS_FUNCTION
COPY_FUNCTION OVERLAPPING_FUNCTION DISJOINT_FUNCTION
DELETE_FUNCTION FILE_IN_FUNCTION FILE_OUT_FUNCTION DOT
COMMA SC FOR FOREACH WHILE IF ELSE_IF ELSE RETURN 
PRINT BOOLEAN_TYPE STRING_TYPE DOUBLE_TYPE INT_TYPE CHAR_TYPE 
SET_TYPE VOID_TYPE MAIN FUNCTION STRING_LITERAL INT_LITERAL DOUBLE_LITERAL
BOOLEAN_LITERAL CHAR_LITERAL IDENTIFIER IDENTIFIER_SET FUNCTION_NAME COLON

%%
program: main_definition | function_definitions
	| function_definitions main_definition | void ;

main_definition: VOID_TYPE MAIN LP RP LB stmt_list RB 
		| VOID_TYPE MAIN LP RP LB void RB ;

function_definitions: function_definitions function_definition
                      | function_definition ;

function_definition: return_type FUNCTION FUNCTION_NAME LP formal_params RP LB stmt_list RB ;
	   
call_stmt: FUNCTION_NAME LP actual_params RP
	  | IDENTIFIER_SET dot primitive_set_function
	  | set_deletion ;

stmt_list: stmt 
	   | stmt_list stmt ;
 
stmt: compound | non_compound SC ;

compound: if_stmt | loop_stmt ;

if_stmt: if_block else_if_block
          |  if_block else_block
          |  if_block else_if_block else_block  |  if_block ;
 
if_block: IF LP exp RP LB stmt_list RB ;

else_if_block: ELSE_IF LP exp RP LB stmt_list RB else_if_block
              |  ELSE_IF LP exp RP LB stmt_list RB ;

else_block:  ELSE LB stmt_list RB ;
 
non_compound: print_stmt | return_stmt 
              | assignment_stmt | type_definition_stmt  
	      | set_stream_stmt | call_stmt ;

type_definition_stmt: set_def_stmt
		      | primitive_def_stmt ;

set_def_stmt: set_type set_keyword IDENTIFIER_SET ;

primitive_def_stmt: primitive_type IDENTIFIER ;

assignment_stmt: type_definition_stmt assignment_operator exp
                 | IDENTIFIER assignment_operator exp
                 | IDENTIFIER_SET assignment_operator exp ;

loop_stmt: for_stmt | while_stmt ;

for_stmt: FOR LP assignment_loop_stmt SC loop_exp SC  assignment_loop_stmt RP LB stmt_list RB 
	  | FOREACH LP primitive_type IDENTIFIER COLON IDENTIFIER_SET RP LB stmt_list RB ;

while_stmt: WHILE LP exp RP LB stmt_list RB ;

assignment_loop_stmt: assignment_stmt | void ;

loop_exp: logical_exp | void ;

return_stmt: RETURN exp | RETURN void ;

print_stmt: PRINT LP exp RP ;

return_type: primitive_type | VOID_TYPE | set_keyword ;

actual_params: void | parameter_exp  
               | parameter_exp comma actual_params_second ;
				 
parameter_exp: exp ;

actual_params_second:parameter_exp
                     | parameter_exp comma actual_params_second ;
					      
formal_params: void | type_definition_stmt 
	       | type_definition_stmt comma formal_params_second ;
			  
formal_params_second: type_definition_stmt
                      | type_definition_stmt comma formal_params_second ;
					       
set_type: primitive_type ;

exp: call_stmt | logical_exp | set_exp ;

logical_exp:  logical_exp_higher logical_or logical_exp  |  logical_exp_higher ;

logical_exp_higher: equal_or_not_exp logical_and logical_exp_higher
    		    | equal_or_not_exp ;
     
equal_or_not_exp: relational_exp equality_signs equal_or_not_exp 
       | relational_exp ;
       
relational_exp: arithmetic_exp relational_op relational_exp | arithmetic_exp ;

arithmetic_exp: arithmetic_exp lower_operator higher_precedence_exp
		| higher_precedence_exp ;
			
higher_precedence_exp: higher_precedence_exp higher_operator arit_exp_part 
 		       | arit_exp_part ;
 
arit_exp_part:  logical_not term | term ;

term: LP logical_exp RP | primary_exp ;

set_exp: set_exp set_relations set_exp_higher | set_exp_higher ;

set_exp_higher: set_exp_higher set_operators set_exp_part | set_exp_part ;

set_exp_part: set_term | logical_not set_term ;

set_term: set | LP set_exp RP ;

lower_operator: plus_operator | MINUS ;

higher_operator: MULTIPLICATION | DIVISION | MODULO ;

plus_operator: PLUS ;

relational_op: GREATER_THAN | GREATER_THAN_EQUAL | LESS_THAN | LESS_THAN_EQUAL ;

equality_signs: NOT_EQUAL | EQUALITY ;

logical_or: OR ;

logical_and: AND ;

logical_not: NOT ;

primitive_type: INT_TYPE | STRING_TYPE | DOUBLE_TYPE | BOOLEAN_TYPE | CHAR_TYPE ;

set_keyword: SET_TYPE ;

comma: COMMA ;

void:  ;

dot: DOT ;

assignment_operator: ASSIGNMENT_WITH_MULTIP | ASSIGNMENT_WITH_DIVISION | ASSIGNMENT_WITH_ADDITION| ASSIGNMENT_WITH_SUBTRACTION | ASSIGNMENT ;

set_operators: union | intersection | set_difference
 	             | cartesian_product ;
	
union: UNION ;

intersection: INTERSECTION ;

set_difference: SET_DIFF ;

cartesian_product: CARTESIAN_PRODUCT ;

set_relations: subset | superset | proper_subset | equal_set | equivalent_set 
  		      | overlapping_set | disjoint_set ;
      
superset: SUPERSET ;

subset: SUBSET ;

proper_subset: PROPER_SUBSET ;

equal_set: EQUAL_SET ;

equivalent_set: EQUIVALENT_SET ;

overlapping_set: OVERLAPPING_FUNCTION ;

disjoint_set: DISJOINT_FUNCTION ;

set_stream_stmt: set_input_stmt | set_output_stmt ;

set_input_stmt: set_input_console | set_input_file ;

set_input_console: IDENTIFIER_SET dot INPUT_FUNCTION LP RP ;

set_input_file: IDENTIFIER_SET FILE_IN_FUNCTION string_type ;

set_output_stmt: set_output_console | set_output_file ;

set_output_console: IDENTIFIER_SET dot DISPLAY_FUNCTION LP RP ;
 
set_output_file: IDENTIFIER_SET FILE_OUT_FUNCTION string_type ;

string_type: STRING_LITERAL | IDENTIFIER ;

set: LB void RB | LB set_element RB | LB set_element comma set_sec RB | IDENTIFIER_SET ;

set_sec: set_element | set_element comma set_sec  ;
 
set_element: primary_exp ;

primary_exp: IDENTIFIER | INT_LITERAL | CHAR_LITERAL | DOUBLE_LITERAL 
	     | BOOLEAN_LITERAL | STRING_LITERAL ;

set_deletion: DELETE_FUNCTION LP IDENTIFIER_SET RP ;

primitive_set_function:  set_is_empty | set_add | set_random_remove
			| get_cardinality | set_is_singleton | set_copy
			| set_contains | set_filter | set_remove ;

set_is_empty: IS_EMPTY_FUNCTION LP RP ;

set_add: ADD_FUNCTION LP set_element RP ;

set_random_remove: RANDOM_REMOVE_FUNCTION LP RP ;

set_remove: REMOVE_FUNCTION LP set_element RP ;

get_cardinality: CARDINALITY_FUNCTION LP RP ;

set_is_singleton: IS_SINGLETON_FUNCTION LP RP ;

set_copy: COPY_FUNCTION LP set RP ;

set_contains: CONTAINS_FUNCTION LP set_element RP ;

set_filter: FILTER_FUNCTION LP exp RP ;

%%
#include "lex.yy.c"

void yyerror(char *s)
{
	printf("Syntax error on line %d, oh boy!\n", yylineno); 
}

int main ()
{
	if( yyparse() == 0 ) 
	{ 
		printf("Input program is valid in GNC!\n");
	}
	return 0;
}

 # Start Variable Program, and main
    <programs> ::= <programs> <program> | <program>
    <program> ::= <main_program> | <function_program>
    <main_program> ::= void main() { <stmt_list> }

# Function definitions and function calls
    <function_program> ::= <return_type> func_ident ( <formal_params> ) { <stmt_list> }
			     | <return_type> func_ident ( <formal_params> );

    <call_stmt> ::= ident<dot>func_ident(<actual_params>)
			      | func_ident(<actual_params>)
			      | <primitive_set_function>

# Statements
    <stmt_list> ::= <stmt>  | <stmt> <stmt_list>
    <stmt> ::=  <compound> | <non_compound>;
    <compound> ::= <if_stmt> | <loop_stmt>

# Conditional statements (if, if-else, ...)
    <if_stmt> ::= <if_block> <else_if_block>
    |  <if_block>  <else_block>
    |   <if_block> <else_if_block> <else_block>  |  <if_block> 

    <if_block> ::=  if ( <exp> ) { <stmt_list> } |  if ( <exp> ) <stmt>
    <else_if_block> ::=  else if ( <exp> ) { <stmt_list> } <else_if_block>
    |  else if ( <exp> ) <stmt> <else_if_block>
    |  else if ( <exp> ) { <stmt_list> } 
    |  else if ( <exp> ) <stmt> 
    <else_block> ::=  else { <stmt_list> } | else <stmt> 

    <non_compound> ::= <print_stmt> | <return_stmt> 
    | <assignment_stmt> | <type_definition_stmt>  | <set_stmt> 
    | <call_stmt>

# Type Definitions   
    <type_definition_stmt> ::= <set_def_stmt>
	| <primitive_def_stmt>
    <set_def_stmt> ::= <set_type> <set_keyword> ident_set 
    <primitive_def_stmt> ::= <primitive_type> ident 

# Assignment Statement
    <assignment_stmt> ::= <type_definition_stmt> <assignment_operator> <exp>
    | ident <assignment_operator> <exp>
    | ident_set <assignment_operator> <exp>
   
# Loop statements
    <loop_stmt> ::= <for_stmt> | <while_stmt> 

    <for_stmt> ::= for ( <assignment_loop_stmt>;  <loop_exp>;  <assignment_loop_stmt> ) 
    { <stmt_list> } 

    <while_stmt> ::= while ( <exp> ) { <stmt_list> }

    <set_stmt> ::= <set_pop> | <set_insert> | <set_delete>

    <assignment_loop_stmt> ::= <assignment_stmt> | <void>
    <loop_exp> ::= <logical_exp> | <void>

    <return_stmt> ::= return <exp>
    <print_stmt> ::= print( <exp> )

# Types, Params, Inputs, exps
    <return_type> ::= <primitive_type> | void | <set_keyword>

    <actual_params> ::= <void> |  <primary_exp>  
    | <primary_exp>  <comma> <actual_params>
    <formal_params> ::=  <type_definition_stmt> 
    | <type_definition_stmt> <comma> <formal_params>

    <set_type> ::= <primitive_type>

    <exp> ::= <call_stmt> | <logical_exp>   | <string_op_exp> | <set_exp>
    
    <logical_exp>  ::=  <logical_exp_higher> <or_op> <logical_exp>  |  <logical_exp_higher>
    <logical_exp_higher> ::= <logical_exp_highest><logical_and><logical_exp_higher> | <logical_exp_highest>
    <logical_exp_highest> ::= <relational_exp><equality_signs><logical_exp_highest>  |  <relational_exp>
    <relational_exp> ::= <arithmetic_exp><relational_op><relational_exp> | <arithmetic_exp>
    <arithmetic_exp> ::= <arithmetic_exp><lower_operator><higher_precedence_exp>
    | <higher_precedence_exp>
    <higher_precedence_exp> ::= <higher_precedence_exp><higher_operator><arit_exp_part> | <arit_exp_part>
    <arit_exp_part> ::=  (<arithmetic_exp>) | <primary_exp> 
    <string_op_exp> ::= <string_type><plus_operator><string_op_exp> | <string_type>
    <string_type> ::= string_literal | ident
    <set_exp> ::= <set> | <set_exp><set_operators><set>
    <lower_operator> ::= <plus_operator> | - | <logical_not> 
    <higher_operator> ::= % | * | / 
    <plus_operator> ::= +
    <relational_op> ::= > | >= | < | <= 
    <equality_signs> ::= != | ==
    <logical_op> ::= <or_op> |<logical_and> | <logical_not>
    <logical_and> ::= &&
    <logical_not> ::= !
    <primitive_type> ::= int | string | double | boolean | char
    <set_keyword> ::= set
    <comma> ::= ,
    <void> ::= 
    <dot> ::= .
    <or_op> ::= ||

# Assignment Operator
    <assignment_operator> ::= += | -= | = | /= | *= 

# Set Operators
    <set_operators> ::= <union> | <intersection> | <set_difference> | <complement> | <cartesian_product>

# Set Relations
    <set_relations> ::= <subset> | <superset> | <proper_subset> | <equal_set> | <equivalent_set> | <overlapping_set> | <disjoint_set>

# Statements to input/output sets, from/to keyboard/console or file.
    <set_input> ::= ident_set <dot> input()
    | ident_set <dot> input( <string_type> )
    <set_output> ::= ident_set <dot> output() 
    |  ident_set <dot> output( <string_type> )

# Creating a set
    <set> ::= { <void> } | { <set_element> } | {<set_element> <comma><set_sec>} 
    <set_sec> ::=  <set_element> | <set_element> <comma> <set_sec> 
    <set_element> ::= <primary_exp>
    <primary_exp> ::= ident | string_literal | int_literal | char_literal | double_literal | bool_literal

# Functions that can be called on sets
    <primitive_set_function> ::= <set_deletion> | <set_is_empty> | <set_insert> | <set_pop>
    | <get_cardinality> | <set_delete_element> | <set_is_empty>
    | <set_input> | <set_output>

# Primitive Set Functions
    <set_deletion> ::= ident_set <dot> delete ()
    <set_is_empty> ::= ident_set <dot>
    <set_insert> ::= ident_set <dot> insert ( <set_element> )
    <set_pop> ::= ident_set <dot> pop ()
    <get_cardinality> ::= ident_set <dot> cardinality()
    <set_delete_element> ::= ident_set <dot> deleteElement( <set_element >)
    <set_is_empty> ::= ident_set <dot> isEmpty()

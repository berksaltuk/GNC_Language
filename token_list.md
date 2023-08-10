# Relation etc tokens
- = 							
- +				       	        	
- -				       	        
- *								
- /								
- %								
- ==					        	
- !=					        	
- <									
- <=								
- >								
- >=							
- *=							
- /=							
- +=							
- -=							
- &&							
- ||							
- !

# Set operations (TODO)

- u
- n
- \ (--)			
- &s2 *> &s1 (&s2 >>> &s1)
- &s2 <* &s1 (&s2 <<< &s1)
- max
- min
- avg
- copy
- contains 
- pop  
- push
- file_in
- file_out
- display
- cardinality
- is_singelton
- filter ?

# Composite Tokens (TODO - SORULACAK)

# Example Programme
```
    int set &s1;
    int set &s2;

    &s1.push(5);
    &s1.push(6);

    &s2.push(7);

    int set &s3 = &s1 U &s2; 
    (set s3 bu şekilde set identifier olabilir mi ?)

    #int function foo() {
        <statements>
    }

    #int function foo();

    foo();

    // Sorulacak

```
# Key word tokens
- main
- print
- return
- function
- if
- else_if
- else
- while
- for
- ;
- ,
- .
- (								
- )								
- {								
- }								

# Type tokens
- int				      			
- boolean				      		
- double				      		
- char
- set
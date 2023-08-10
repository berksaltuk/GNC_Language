# TODO List

### Filter - fikrinden daha kolay daha basit ve daha mantıklı olabilir
```
    filter(<predicate>) 
```

## General
```
    - Daha fazla primitive set operasyonu bulunmalı
    - Union / Intersection için default token olarak (n, u, x) tarzı seyler olabilir mi?

    - Nasıl print etmemiz gerekicek (No libraries included diyordu sanki)
```

#int function foo() {
    &s1 = {1, 2, 4}
    &s1  &s2.filter(x < 5)
}

## BNF
```
    - Extra set operations
        - Partitioning
        - Sayılar hariç olmaması yapılabilir mi bilmiyorum (ASCII)
            - Max
            - Min
            - Average 
            - Copy()
            - Contains() 
            - Pop(element)
            - Push(element) - Input()
            - File_In()
            - File_Out()
            - Display()
            - {1, 2, 5, 6}.filter(x < 3) = {1, 2}
            - Singelton

    - Notes
        - union
        - cartesian_product
        - intersection
        - difference
        - ...
```     

##  Lex
```
    - Order
```
##  Report
```
    - Abstract
    - Design
    - BNF
```

## PART A Spesifications

```
    - A project report including the following components:
        - Name, ID and section for all of the project group members.
        - The name of your language.
        - The complete BNF description of your language.
        - One paragraph explanation for each language construct (i.e. nonterminals) detailing their intended usage and meaning, as well as all of the associated conventions.
        - Descriptions of how nontrivial tokens (comments, identifiers, literals, reserved words, etc) are defined in your language. For all of these, explain what your motivations and constraints were and how they relate to various language criteria such as readability, writability, reliability, etc.
    - Evaluate your language in terms of
        - Readability
        - Writability
        - Reliability
```


```
Part C - Example Programs (30 points)
Finally, you will prepare test programs of your choice that exercises all of the language constructs in your language, including the ones that you may have defined in addition to the required list given above. Your test programs should include at least the ones given below:

a program that reads a set from a file, whose name is given,
displays the elements on the console, or a special message if the set is empty.
a program that initializes a variable to a set of elements of your choice,
initializes the second variable to a set of elements of your choice,
initializes the third variable to the union of the sets in the other two variables,
displays the elements of the third variable,
saves the contents of the third variable to a file,
deletes all of these variables.
a program that defines a fuunction that thats a set and element as its argument,
removes that element from the set and returns the remaining elements,
reads a set from a file,
removes an element of your choice from the set by calling the function defined,
displays the resulting set.
Make sure your lex implementation correctly identifies all the tokens. The TA will test your lexical analyzer with these example programs along with other programs written in your language.
Do not panic! You are not required to write an interpreter or compiler for this language. Just write a few programs in the language you designed and make sure that the lexical analyzer produces the right sequence of tokens. Be creative, have some fun.
```
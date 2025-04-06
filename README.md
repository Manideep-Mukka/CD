# 23115058_CD

GITHUB Link:-
https://github.com/Manideep-Mukka/CD


This project implements a basic parser and lexer using **Flex** (lex) and **Bison** (yacc). It consists of the following components:

---

## Files Overview

### 1. `parser.y`
This file contains Bison grammar rules and C actions for the parser. It defines the syntax rules of the language and actions to take when those rules are matched.

### 2. `lexer.l`
This file defines the lexical rules using Flex. It scans the input and converts it into tokens that the parser understands.

### 3. `parser.tab.h`
This is the header file auto-generated by Bison, containing token definitions.

### 4. `parser.tab.c`
This is the C file generated by Bison that contains the parser logic based on the grammar rules in `parser.y`.

### 5. `lex.yy.c`
This is the C file generated by Flex that contains the lexical analyzer created from `lexer.l`.

### 6. `parser`
This is likely the compiled executable or a script that runs the final parser.

---

## Build Instructions

### Step 1: Generate Parser Files
Make sure Bison is installed. Run the following command:
```bash
bison -d parser.y
```
This will generate:
- `parser.tab.c` - the parser implementation
- `parser.tab.h` - the token header file

### Step 2: Generate Lexer File
Ensure Flex is installed. Then run:
```bash
flex lexer.l
```
This generates:
- `lex.yy.c` - the lexer implementation

### Step 3: Compile the Project
Compile the generated C files using `gcc`:
```bash
gcc -o parser parser.tab.c lex.yy.c -lfl
```
This will create the `parser` executable.

---

## Run the Parser
Once compiled, you can run the parser using:
```bash
./parser < input_file
```
Replace `input_file` with your source file to be parsed.

---

## Dependencies
- Bison
- Flex
- GCC Compiler

---


---

## Example

### Input
You can test the parser with a simple arithmetic expression like:

```
x*y*z-2
```

Save this expression into a file, for example `input.txt`.

### Run Command
```bash
./parser < input.txt
```

### Expected Output
The parser will process the expression according to the grammar rules defined in `parser.y` and lexical rules in `lexer.l`. 
The actual output depends on how actions are defined in your parser (e.g., print statements, computation, or syntax validation).

---
## Notes
- Make sure all files (`parser.y`, `lexer.l`, etc.) are in the same directory before starting.
- This setup assumes a Unix-like environment.


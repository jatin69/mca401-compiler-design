# Calculator using lex yacc

A simple calculator using lex yacc.

## How to make

- `make` to build : this will generate the usual files
- `make run` to execute
- For debugging, use `make clean && make debug && make run`  

## Features

Checkout the [execution logs](./logs.md) to see features in action.

- single character identifiers `a` to `z`
- Unary `-` supported
- Arithmetic operators supported
- Logical AND and OR supported
- precedence order is {`*`, `/`, `%`} > {`+`, `-`} > {`&`} > {`|`}
- Brackets `(` and `)` supported for custom precedence
- exit by typing `quit` or `exit`
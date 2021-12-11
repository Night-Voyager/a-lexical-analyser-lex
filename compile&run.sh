#!/bin/bash
flex a\ lexical\ analyser.l
cc lex.yy.c -ll
./a.out < test.c
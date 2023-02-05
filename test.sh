#!/bin/bash

# bash -xで実行すると変数を展開して表示する

assert(){
  expected="$1"
  input="$2"

  ./9cc "$input" > tmp.s
  cc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected, but got $actual"
    exit 1
  fi 
}

assert 0 0
assert 42 42
assert 21 "5+20-4"
assert 20 " 4 + 10 + 10 -4"

echo OK
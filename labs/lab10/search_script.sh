#!/bin/bash

# Инициализация переменных
input_file=""
output_file=""
pattern=""
case_sensitive=0
show_line_numbers=0

# Анализ командной строки
while getopts ":i:o:p:Cn" opt; do
  case $opt in
    i) input_file="$OPTARG";;
    o) output_file="$OPTARG";;
    p) pattern="$OPTARG";;
    C) case_sensitive=1;;
    n) show_line_numbers=1;;
    \?) echo "Invalid option: -$OPTARG"; exit 1;;
  esac
done

# Проверка обязательных параметров
if [ -z "$input_file" ] || [ -z "$pattern" ]; then
  echo "Usage: $0 -i inputfile -p pattern [-o outputfile] [-C] [-n]"
  exit 1
fi

# Выполнение поиска
if [ $case_sensitive -eq 1 ]; then
  if [ $show_line_numbers -eq 1 ]; then
    grep -n "$pattern" "$input_file" > "$output_file"
  else
    grep "$pattern" "$input_file" > "$output_file"
  fi
else
  if [ $show_line_numbers -eq 1 ]; then
    grep -in "$pattern" "$input_file" > "$output_file"
  else
    grep -i "$pattern" "$input_file" > "$output_file"
  fi
fi


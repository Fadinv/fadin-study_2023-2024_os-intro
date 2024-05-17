#!/bin/bash

# Проверка аргументов
if [ $# -eq 1 ]; then
  # Создание файлов
  for i in $(seq 1 $1); do
    touch "$i.tmp"
  done
elif [ $# -eq 2 ] && [ "$1" = "delete" ]; then
  # Удаление файлов
  for i in $(seq 1 $2); do
    rm -f "$i.tmp"
  done
else
  echo "Usage: $0 <number_of_files> or $0 delete <number_of_files>"
  exit 1
fi

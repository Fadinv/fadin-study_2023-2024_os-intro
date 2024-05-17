#!/bin/bash

# Каталог с файлами man
man_dir=/usr/share/man/man1

# Получение имени команды из аргумента командной строки
command_name=$1

# Поиск файла man по имени команды
man_file=$(find "$man_dir" -name "$command_name.1.gz")

# Если файл найден, выводим его содержимое
if [ -n "$man_file" ]; then
  echo "Справка по команде $command_name:"
  gzip -dc "$man_file" | groff -mandoc -Tascii | col -b | iconv -f UTF-8 -t CP866 | less
else
  echo "Справка по команде $command_name не найдена"
fi
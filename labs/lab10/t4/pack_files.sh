#!/bin/bash

# Проверка аргументов
if [ $# -ne 1 ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Установка директории
directory=$1

# Создание имени архива
archive_name="${directory##*/}.tar.gz"

# Запаковка файлов в архив, измененных менее недели тому назад
find "$directory" -type f -mtime -7 -exec tar -rf "$archive_name" {} \;
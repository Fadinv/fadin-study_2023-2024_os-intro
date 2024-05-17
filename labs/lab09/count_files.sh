#!/bin/bash

# Проверка наличия аргументов
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <file_extension>"
    exit 1
fi

# Получение аргументов
directory=$1
file_extension=$2

# Вычисление количества файлов с указанным расширением
count=$(find "$directory" -type f -name "*.$file_extension" | wc -l)

# Вывод результата
echo "Number of files with extension .$file_extension in $directory: $count"
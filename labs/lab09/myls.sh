#!/bin/bash

# Функция для вывода информации о файле или каталоге
print_file_info() {
    local file=$1
    if [ -e "$file" ]; then
        local perms=$(stat -c "%a" "$file")
        local owner=$(stat -c "%U" "$file")
        local group=$(stat -c "%G" "$file")
        local size=$(stat -c "%s" "$file")
        local mtime=$(stat -c "%y" "$file")

        # Вывод информации о файле или каталоге
        echo "${perms} ${owner}:${group} ${size} ${mtime} ${file}"
    else
        echo "Error: $file does not exist"
    fi
}

# Функция для рекурсивного вывода информации о каталоге
print_dir_info() {
    local dir=$1
    if [ -e "$dir" ]; then
        echo "Directory: $dir"
        for file in "$dir"/*; do
            if [ -e "$file" ]; then
                if [ -d "$file" ]; then
                    # Если файл - каталог, рекурсивно выводим информацию о нем
                    print_dir_info "$file"
                else
                    # Если файл - обычный файл, выводим информацию о нем
                    print_file_info "$file"
                fi
            fi
        done
    else
        echo "Error: $dir does not exist"
    fi
}

# Обработка аргументов командной строки
if [ $# -eq 0 ]; then
    # Если аргументов нет, выводим информацию о текущем каталоге
    print_dir_info "."
else
    # Если аргументы есть, выводим информацию о каждом из них
    for arg in "$@"; do
        if [ -d "$arg" ]; then
            # Если аргумент - каталог, выводим информацию о нем
            print_dir_info "$arg"
        else
            # Если аргумент - файл, выводим информацию о нем
            print_file_info "$arg"
        fi
    done
fi
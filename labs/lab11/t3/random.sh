#!/bin/bash

# Определение функции для генерации случайной буквы
generate_random_letter() {
    # Генерация случайного числа в диапазоне от 0 до 25
    random_number=$(( $RANDOM % 26 ))
    
    # Преобразование случайного числа в соответствующую букву латинского алфавита
    random_letter=$(printf "\\x$(printf %x $(( 65 + random_number )))")
    
    # Вывод случайной буквы
    echo -n "$random_letter"
}

# Определение количества символов в последовательности
sequence_length=10

# Генерация случайной последовательности букв
for (( i=0; i<$sequence_length; i++ )); do
    generate_random_letter
done

# Вывод символа новой строки
echo
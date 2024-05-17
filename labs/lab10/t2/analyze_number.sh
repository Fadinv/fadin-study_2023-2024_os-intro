#!/bin/bash

./program
case $? in
    0) echo "Вы ввели 0.";;
    1) echo "Вы ввели положительное число.";;
    2) echo "Вы ввели отрицательное число.";;
    *) echo "Unknown error.";;
esac

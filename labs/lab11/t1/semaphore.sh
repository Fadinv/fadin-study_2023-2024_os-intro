#!/bin/bash

# Имя файла-семафора
semaphore_file="semaphore.lock"

# Время ожидания освобождения ресурса (секунды)
t1=10

# Время использования ресурса (секунды)
t2=5

# Функция ожидания освобождения ресурса
wait_for_resource() {
  echo "Waiting for resource to be released..."
  while [ -f "$semaphore_file" ]; do
    sleep 1
  done
  echo "Resource released, using it..."
}

# Функция использования ресурса
use_resource() {
  touch "$semaphore_file"
  echo "Using resource..."
  sleep $t2
  echo "Resource used, releasing it..."
  rm "$semaphore_file"
}

# Ожидание освобождения ресурса
wait_for_resource

# Использование ресурса
use_resource

# Создание файла-семафора для следующего процесса
touch "$semaphore_file"
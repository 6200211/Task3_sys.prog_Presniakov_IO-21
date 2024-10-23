#!/bin/bash

# Завантаження псевдонімів з ~/.bashrc
shopt -s expand_aliases
source ~/.bashrc

# Перевірка, що передано два параметри
if [ $# -ne 2 ]; then
  echo "Помилка: необхідно вказати два числові параметри."
  exit 1
fi

# Отримання параметрів
param1=$1
param2=$2

# Перевірка, чи є параметри числами
if ! [[ "$param1" =~ ^[0-9]+$ ]] || ! [[ "$param2" =~ ^[0-9]+$ ]]; then
  echo "Помилка: обидва параметри повинні бути числами."
  exit 1
fi

# Порівняння параметрів
if [ "$param1" -gt "$param2" ]; then
  echo "Перший параметр ($param1) більше за другий ($param2)."
  echo "Список псевдонімів (alias):"
  alias
else
  echo "Перший параметр ($param1) не більше за другий ($param2)."
  script_name=$(basename "$0")
  script_size=$(stat -c%s "$script_name")
  echo "Розмір файлу скрипта '$script_name': $script_size байт."
fi


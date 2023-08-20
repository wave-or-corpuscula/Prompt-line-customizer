#!/bin/bash -i

# Запрос ввода названия переменной окружения
# echo -n "Введите название переменной окружения: "
# read env_variable

# # Вывод значения переменной окружения
# # value=$(eval echo "\$$env_variable")
# value=$(printenv "$env_variable")

# if [ -z "$value" ]; then
#     echo "Переменная окружения '$env_variable' не существует или не имеет значения."
# else
#     echo "Значение переменной окружения '$env_variable': $value"
# fi


env_variable=MY_VAR
value=$(printenv "$env_variable")
prompt="\$$env_variable"

echo "${prompt@P}"
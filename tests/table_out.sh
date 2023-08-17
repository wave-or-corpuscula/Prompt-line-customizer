#!/bin/bash

# Пример массивов с данными (предполагается, что массивы имеют одинаковую длину)
names=("Alice" "Bob" "Charlie" "David")
ages=(25 30 28 22)
cities=("New York" "" "Chicago" "Houston")   # Пример пустого значения
occupations=("Engineer" "Artist" "Teacher" "Doctor kjd j lj lsjd lj lsj lgj l jl jl jfl gf lj")

# Максимальные ширины столбцов
max_name_width=15
max_age_width=7
max_city_width=20
max_occupation_width=15

# Вывод заголовка таблицы
echo "-------------------------------------------------------------"
printf "| %-15s | %-7s | %-20s | %-15s |\n" "Number" "Symbol" "Appearance" "Description"
echo "-------------------------------------------------------------"

# Итерация по индексам массивов и вывод данных в виде таблицы
for ((i = 0; i < ${#names[@]}; i++)); do
    name="${names[i]}"
    age="${ages[i]}"
    city="${cities[i]}"
    occupation="${occupations[i]}"

    # Подготовка строк с переносами
    name_lines=$(echo "$name" | fold -s -w $max_name_width)
    age_lines=$(echo "$age" | fold -s -w $max_age_width)
    city_lines=$(echo "$city" | fold -s -w $max_city_width)
    occupation_lines=$(echo "$occupation" | fold -s -w $max_occupation_width)

    # Определение максимального количества строк
    max_lines=$(echo -e "$name_lines\n$age_lines\n$city_lines\n$occupation_lines" | wc -l)

    # Вывод строк таблицы построчно, пропуская строки без информации
    for ((j = 1; j <= $max_lines; j++)); do
        name_line=$(echo "$name_lines" | sed -n "${j}p")
        age_line=$(echo "$age_lines" | sed -n "${j}p")
        city_line=$(echo "$city_lines" | sed -n "${j}p")
        occupation_line=$(echo "$occupation_lines" | sed -n "${j}p")

        # Пропускаем вывод строки, если все поля пустые
        if [[ -n "$name_line" || -n "$age_line" || -n "$city_line" || -n "$occupation_line" ]]; then
            printf "%-15s \t %-7s \t %-20s \t %-15s \n" "$name_line" "$age_line" "$city_line" "$occupation_line"
            # echo "-------------------------------------------------------------"
        fi
    done
done

#!/bin/bash

if [ ! -d "$1" ]; then
    echo "Ошибка: Входная директория не существует!"
    exit 1
fi
input_dir=$1
output_dir=$2
mkdir -p "$output_dir"
find "$input_dir" -type f | while read file; do
    base_name=$(basename "$file")
    output_file="$output_dir/$base_name"
    c=1
    while [ -f "$output_file" ]; do
        output_file="${output_dir}/${base_name%.*}_${c}.${base_name##*.}"
        ((c++))
    done
    cp "$file" "$output_file"
done
echo "Копирование всех файлов из '$input_dir' в '$output_dir' произведено успешно!"




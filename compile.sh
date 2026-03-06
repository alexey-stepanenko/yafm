#!/bin/bash

# == НАЧАЛО БЛОКА ИЗМЕНЯЕМЫХ ПАРАМЕТРОВ ==

# Путь к файлу с настройками оносительно каталога репозитория
# Например:
# conf="conf/my-conf.json"
conf="conf/conf.template.json"

# == КОНЕЦ БЛОКА ИЗМЕНЯЕМЫХ ПАРАМЕТРОВ ==

# Путь к файлу запуска интерпретатора OneScript, может понадобиться установка абсолютного пути
oscript_engine="oscript"

script="develop.os"
command="compile"
repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

exec="$oscript_engine \"$repo/scripts/$script\" $command -conf \"$conf\""

eval "$exec"
# Скрипты

В этом каталоге располагаются скрипты для упрощения разработки.

## create-build

Скрипт создания нового билда. Выгружает конфигурацию в исходники, автоматически увеличивает
номер билда в версии конфигурации, изменяет функцию **Версия** модуля **МФСлужебный**

Для упрощения вызова можно использовать дополнительный скрипт для конкретной ОС. Например, для Linux:

``` bash
#!/bin/bash

oscript_engine="oscript"
script="create-build/main.os"
infobase="File=""/home/alexey/repo/yafm/infobase"";"
infobase_user="Администратор"
src="/home/alexey/repo/yafm/src"
platform="8.3.26"

trim() {
    local var="$*"
    # Удаляем все неотображаемые символы с начала и конца
    var="${var#"${var%%[![:space:]]*}"}"
    var="${var%"${var##*[![:space:]]}"}"
    echo -n "$var"
}

basedir=$(dirname "$(readlink -f "$0")")

exec="$oscript_engine $basedir/$script create -infobase \"$infobase\""

infobase_user=$(trim "$infobase_user")
if [ $infobase_user != "" ]
then
    exec="$exec -infobase-user $infobase_user"
fi
platform=$(trim "$platform")
if [ $platform != "" ]
then
    exec="$exec -platform \"$platform\""
fi

exec="$exec -source $src"

eval "$exec"
```

## create-release

Скрипт создания нового релиза. Создает файл поставки и расширение для разработчика. Версия релиза читается из Configuration.xml

Строка вызова:

``` bash
oscript ./scripts/create-release.os create -source ./src -releases ./releases/ -distrib-variants "Поставка,РасширениеРазработчикаДляПоставки"
```

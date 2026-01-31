[![GitHub release](https://img.shields.io/github/release/alexey-stepanenko/yafm.svg?style=flat-square)](https://github.com/alexey-stepanenko/yafm/releases)
[![GitHub license](https://img.shields.io/github/license/alexey-stepanenko/yafm.svg?style=flat-square)](https://github.com/alexey-stepanenko/yafm/blob/main/LICENSE)

# Еще один модификатор форм 1С (Yet another form modificator)

Еще один вариант по упрощению программной доработки форм. Основное отличие от аналогов - все изменения формы (реквизиты, команды, элементы) оформляются в виде текстового макета.

Само изменение формы производится в обработчике **ПриСозданииНаСервере** формы:

``` bsl
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
    МодификацияФорм.МодифицироватьФорму(
        ЭтаФорма,
        Отказ,
        "Обработки.ОписанияМодификацийФорм.Документ_Заказ_ФормаДокумента"
    );
КонецПроцедуры
```

Пример макета изменения конфигурации:

![Макет изменения формы](/docs/img/template.png "Макет изменения формы")

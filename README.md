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
<pre>
<span style="color: red;">LETTER klhklhkjh HKHJKHKJHJK JKHKJKJHKHKJ
    </span>
    <span style="color: green;">LETTER klhklhkjh HKHJKHKJHJK JKHKJKJHKHKJ</span>
    <span style="color: blue;">LETTER klhklhkjh HKHJKHKJHJK JKHKJKJHKHKJ</span>
    <span style="color: red;">LETTER klhklhkjh HKHJKHKJHJK JKHKJKJHKHKJ</span>
    <span style="color: green;">LETTER klhklhkjh HKHJKHKJHJK JKHKJKJHKHKJ</span>
    <span style="color: blue;">LETTER klhklhkjh HKHJKHKJHJK JKHKJKJHKHKJ</span>
    <span style="color: red;">LETTER klhklhkjh HKHJKHKJHJK JKHKJKJHKHKJ</span>
    <span style="color: green;">LETTER klhklhkjh HKHJKHKJHJK JKHKJKJHKHKJ</span>
    <span style="color: blue;">LETTER klhklhkjh HKHJKHKJHJK JKHKJKJHKHKJ</span>
  </nobr><br>
</pre>
<div style="font-family: monospace;">
</div>

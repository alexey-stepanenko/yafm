﻿
&НаКлиенте
Перем ОбъектBody;

//////////////////////////////////////////////////////////////////////////////// 
// ОБРАБОТЧИКИ СОБЫТИЙ 
//

// Процедура-обработчик события "ПриСозданииНаСервере"
//
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ДемонстрацияДиаграмм = Обработки.ДемонстрацияВозможностейДиаграмм.ПолучитьМакет("ДемонстрацияВозможностейДиаграмм").ПолучитьТекст();
КонецПроцедуры

// Процедура-обработчик события "ПриНажатии"
// Обрабатывает события из HTML-макета Обработки.ДемонстрацияВозможностейДиаграмм.Макеты.ДемонстрацияВозможностейДиаграмм,
// которые в свою очередь приходят из конфигурации 'Демонстрационная конфигурация "Диаграммы"'
//
&НаКлиенте
Процедура ДемонстрацияДиаграммПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	Если НЕ ДанныеСобытия.Anchor = Неопределено Тогда
		Если ДанныеСобытия.Anchor.protocol = "v8:" Тогда
			ЗначениеКоманды = ПолучитьЗначениеКомандыПоСсылке(ДанныеСобытия.Href, "v8:Title=");
			Если ЗначениеКоманды <> Неопределено Тогда
				Заголовок = ЗначениеКоманды;
				Возврат;
			КонецЕсли;
			
			ЗначениеКоманды = ПолучитьЗначениеКомандыПоСсылке(ДанныеСобытия.Href, "v8:PreviousExampleEnabled=");
			Если ЗначениеКоманды <> Неопределено Тогда
				Элементы.ПредыдущийПример.Доступность = ?(ЗначениеКоманды = "true", Истина, Ложь);
				Возврат;
			КонецЕсли;
			
			ЗначениеКоманды = ПолучитьЗначениеКомандыПоСсылке(ДанныеСобытия.Href, "v8:NextExampleEnabled=");
			Если ЗначениеКоманды <> Неопределено Тогда
				Элементы.СледующийПример.Доступность = ?(ЗначениеКоманды = "true", Истина, Ложь);
				Возврат;
			КонецЕсли;
		КонецЕсли;
	КонецЕсли;

КонецПроцедуры

// Процедура-обработчик события "ДокументСформирован"
//
&НаКлиенте
Процедура ДемонстрацияДиаграммДокументСформирован(Элемент)
	
	ОбъектBody = Элементы.ДемонстрацияДиаграмм.Документ.body;

КонецПроцедуры

// Процедура-обработчик команды "ПредыдущийПример"
// Пересылает команду HTML-макету, который в свою очередь перешлет команду
// конфигурации 'Демонстрационная конфигурация "Диаграммы"'
//
&НаКлиенте
Процедура ПредыдущийПример(Команда)
	
	ОбъектBody.v8PostMessage("v8:ShowPreviousExample");
	
КонецПроцедуры

// Процедура-обработчик команды "СледующийПример"
// Пересылает команду HTML-макету, который в свою очередь перешлет команду
// конфигурации 'Демонстрационная конфигурация "Диаграммы"'
//
&НаКлиенте
Процедура СледующийПример(Команда)
	
	ОбъектBody.v8PostMessage("v8:ShowNextExample");
	
КонецПроцедуры

//////////////////////////////////////////////////////////////////////////////// 
// ВСПОМОГАТЕЛЬНЫЕ ПРОЦЕДУРЫ И ФУНКЦИИ
//

&НаКлиенте
Функция ПолучитьЗначениеКомандыПоСсылке(Ссылка, Команда)
	
	Позиция = Найти(Ссылка, Команда);
	Если Позиция > 0 Тогда
		Возврат Сред(Ссылка, Позиция + СтрДлина(Команда));
	Иначе
		Возврат Неопределено;
	КонецЕсли;
	
КонецФункции



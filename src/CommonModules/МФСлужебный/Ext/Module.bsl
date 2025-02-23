﻿//©///////////////////////////////////////////////////////////////////////////©//
//
//  Copyright 2025 Alexey A. Stepanenko 
//    * alexey.stepanenko@gmail.com
//    * TG: @AlexeyStepanenko
//    * https://github.com/alexey-stepanenko
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//©///////////////////////////////////////////////////////////////////////////©//

#Область СлужебныйПрограммныйИнтерфейс

Функция Версия() Экспорт
	Возврат "1.1.0.3";
КонецФункции

Функция ОписаниеМодификаций(ИмяМакетаОписанияМодификаций, Протокол) Экспорт
	Попытка
		МакетОписанияМодификаций = МакетОписанияМодификаций(ИмяМакетаОписанияМодификаций, Протокол);
		// НАЧАЛО БЛОКА РЕЖИМ РАЗРАБОТКИ
		МакетОписанияМодификацийРазработка = РегистрыСведений
			.МФМакеты
			.МакетОписанияМодификаций(ИмяМакетаОписанияМодификаций)
		;
		Если ПустаяСтрока(МакетОписанияМодификацийРазработка.ПолучитьТекст()) Тогда
			ТекстМакетаИзКонфигурации = МакетОписанияМодификаций.ПолучитьТекст();
			РегистрыСведений.МФМакеты.ОбновитьМакетОписанияМодификаций(
				ИмяМакетаОписанияМодификаций,
				ТекстМакетаИзКонфигурации
			);
		Иначе
			МакетОписанияМодификаций.УстановитьТекст(МакетОписанияМодификацийРазработка.ПолучитьТекст());
		КонецЕсли;
		// КОНЕЦ БЛОКА РЕЖИМ РАЗРАБОТКИ
	Исключение
		// BSLLS:NestedFunctionInParameters-off
		СтрокаПротокола = СтрШаблон(
			НСтр("ru='Ошибка получения макета по имени ""%1""'"),
			ИмяМакетаОписанияМодификаций
		);
		// BSLLS:NestedFunctionInParameters-on
		Протокол.ГенераторПротокола.ДобавитьСтрокуВПротокол(Протокол, СтрокаПротокола);
		
		ВызватьИсключение;
	КонецПопытки;
	
	Результат = НовыйОписаниеМодификаций();
	ИндексСтрокиЗаголовка = 1;
	ОбработатьСтрокуЗаголовка(Результат, МакетОписанияМодификаций, ИндексСтрокиЗаголовка, Протокол);
	ОбработатьСтрокиМакета(Результат, МакетОписанияМодификаций, ИндексСтрокиЗаголовка, Протокол);
	
	Возврат Результат;
КонецФункции

Функция МакетОписанияМодификаций(ИмяМакетаОписанияМодификаций, Протокол) Экспорт
	СимволРазделитель = ".";
	
	ПозицияПоследнегоРазделителя = СтрНайти(ИмяМакетаОписанияМодификаций, СимволРазделитель, НаправлениеПоиска.СКонца);
	ИмяМакета = Прав(ИмяМакетаОписанияМодификаций, СтрДлина(ИмяМакетаОписанияМодификаций) - ПозицияПоследнегоРазделителя);
	ПолноеИмяОбъекта = Лев(ИмяМакетаОписанияМодификаций, ПозицияПоследнегоРазделителя - 1);
	
	Попытка
		ОбъектМетаданных = ОбъектИзКоллекцииМетаданных(Метаданные, ПолноеИмяОбъекта, СимволРазделитель);
		Если Метаданные.ОбщиеМакеты.Содержит(ОбъектМетаданных) Тогда
			Результат = ПолучитьОбщийМакет(ИмяМакета);
		Иначе
			Менеджер = Новый (СтрЗаменить(ОбъектМетаданных.ПолноеИмя(), ".", "Менеджер."));
			Результат = Менеджер.ПолучитьМакет(ИмяМакета);
		КонецЕсли;
	Исключение
		
		ВызватьИсключение;
	КонецПопытки;
	
	Возврат Результат;
КонецФункции

// Создает протокол модификации формы на основании генератора протокола
//
// Параметры:
//  ГенераторПротокола - ОбщийМодуль, Неопределено - Общий модуль, реализующий интерфейс генератора протокола модификации формы.
//    При указании значения Неопределено будет использован генератор по умолчанию (общий модуль МФГенераторПротокола)
//    При указании общего модуля он должен содержать следующие процедуры:
//    * ИнициализироватьПротокол
//    * ОбработатьОписаниеОшибки
//    * ДобавитьСтрокуВПротокол
//    * СформироватьТекстПротокола
//    См. дополнительно модуль МФГенераторПротокола.
//    При использовании генератора по умолчанию возможна настройка работы, 
//    см. дополнительно общий модуль МФГенераторПротоколаПереопределяемый.
//
// Возвращаемое значение:
//  Структура
//   * ГенераторПротокола - ОбщийМодуль - Значение, переданное в параметре ГенераторПротокола функции.
//   * ДанныеПротокола - Массив из Строка - Содержимое протокола.
//   * ДополнительныеПараметры - Произвольный - Произвольные дополнительные данные.
//   * ПрерватьМодификациюПриОшибке - Булево - При возникновении первой ошибки процесс модификации
//       прерывается.
//   * ПрерватьВыводФормыПриОшибкахМодификации - Булево - При непустом содержимом данных протокола вывод формы
//       подавляется (параметр Отказ процедуры МодификацияФорм.МодифицироватьФорму устанавливается в Истина).
//
Функция Протокол(ГенераторПротокола) Экспорт
	Результат = НовыйПротокол();
	
	Если ГенераторПротокола = Неопределено Тогда
		ГенераторПротокола = МФГенераторПротокола;
	КонецЕсли;
	Результат.ГенераторПротокола = ГенераторПротокола;
	Результат.ГенераторПротокола.ИнициализироватьПротокол(Результат);
	
	Возврат Результат;
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция НовыйПротокол()
	Результат = Новый Структура;
	Результат.Вставить("ГенераторПротокола", Неопределено);
	Результат.Вставить("ДанныеПротокола", Неопределено);
	Результат.Вставить("ДополнительныеПараметры", Неопределено);
	Результат.Вставить("ПрерватьМодификациюПриОшибке", Неопределено);
	Результат.Вставить("ПрерватьВыводФормыПриОшибкахМодификации", Неопределено);
	
	Возврат Результат;
КонецФункции

#Область ОбработкаОшибок

Функция НовыйОписаниеОшибки()
	Результат = Новый Структура;
	
	Результат.Вставить("ДополнительнаяИнформация", Неопределено);
	Результат.Вставить("ИмяМодуля", Неопределено);
	Результат.Вставить("ИсходнаяСтрока", Неопределено);
	Результат.Вставить("Код", Неопределено);
	Результат.Вставить("НомерСтроки", Неопределено);
	Результат.Вставить("Описание", Неопределено);
	Результат.Вставить("НомерСтрокиМакета", Неопределено);
	Результат.Вставить("СтрокаМакета", Неопределено);
	
	Возврат Результат;
КонецФункции

Процедура ЗаполнитьОписаниеОшибкиИзИнформацииОбОшибке(ОписаниеОшибки, ИнформацияОбОшибке)
	ЗаполнитьЗначенияСвойств(ОписаниеОшибки, ИнформацияОбОшибке);
КонецПроцедуры

#КонецОбласти

#Область ОписаниеМодификаций

Функция ОбъектИзКоллекцииМетаданных(КоллекцияМетаданных, ПолноеИмяОбъекта, СимволРазделитель)
	ИмяОбъекта = ПолноеИмяОбъекта;
	Коллекция = КоллекцияМетаданных;
	ОбъектМетаданных = Неопределено;
	Пока Истина Цикл
		ПозицияРазделителя = СтрНайти(ИмяОбъекта, СимволРазделитель);
		Если ПозицияРазделителя = 0 Тогда
			ОбъектМетаданных = Коллекция[ИмяОбъекта];
			Прервать;
		КонецЕсли;
		ИмяПодчиненнойКоллекции = Лев(ПолноеИмяОбъекта, ПозицияРазделителя - 1);
		ИмяОбъекта = Прав(ПолноеИмяОбъекта, СтрДлина(ПолноеИмяОбъекта) - ПозицияРазделителя);
		Коллекция = КоллекцияМетаданных[ИмяПодчиненнойКоллекции];
	КонецЦикла;
	
	Возврат ОбъектМетаданных;
КонецФункции

// Конструктор описания модификации формы по текстовому описанию
//
// Возвращаемое значение:
//   Структура:
//     * Версия - Строка - Версия описания. Сейчас может быть любым. Не анализируется.
//     * Команды - Структура - Описания команд формы.
//     * Рамки - Структура - Описания рамок.
//     * РазделительПолей - Строка - Символ-разделитель полей в описании модификации.
//     * Реквизиты - Структура - Описания реквизитов формы.
//     * СочетанияКлавиш - Структура - Описания сочетаний клавиш.
//     * Цвета - Структура - Описания цветов.
//     * Элементы - Структура - Описания добавляемых и/или изменяемых элементов формы.
//
Функция НовыйОписаниеМодификаций()
	Результат = Новый Структура;
	
	Результат.Вставить("Версия", "");
	
	Результат.Вставить("Команды", Новый Структура);
	
	Результат.Вставить("Рамки", Новый Структура);
	Результат.Вставить("РазделительПолей", "");
	Результат.Вставить("Реквизиты", Новый Структура);
	
	Результат.Вставить("СочетанияКлавиш", Новый Структура);
	
	Результат.Вставить("Цвета", Новый Структура);
	
	Результат.Вставить("Элементы", Новый Структура);
	
	Возврат Результат;
КонецФункции

Процедура ОбработатьСтрокуЗаголовка(ОписаниеМодификаций, МакетОписанияМодификаций, ИндексСтрокиЗаголовка, Протокол)
	СтрокаЗаголовка = МакетОписанияМодификаций.ПолучитьСтроку(ИндексСтрокиЗаголовка);
	Попытка
		ЗаполнитьПараметрыМодификации(СтрокаЗаголовка, ОписаниеМодификаций);
	Исключение
		ИнформацияОбОшибке = ИнформацияОбОшибке();
		ОписаниеОшибки = НовыйОписаниеОшибки();
		ЗаполнитьОписаниеОшибкиИзИнформацииОбОшибке(ОписаниеОшибки, ИнформацияОбОшибке);
		ОписаниеОшибки.НомерСтрокиМакета = ИндексСтрокиЗаголовка;
		ОписаниеОшибки.СтрокаМакета = СтрокаЗаголовка;
		Протокол.ГенераторПротокола.ОбработатьОписаниеОшибки(Протокол, ОписаниеОшибки);
		
		// TODO 2024-12-02: Добавить что? возможно забыл удалить, обработка ошибки уже есть
		// TODO 2024-11-20: Добавить
		ВызватьИсключение;
	КонецПопытки;
КонецПроцедуры

Процедура ЗаполнитьПараметрыМодификации(СтрокаЗаголовка, ОписаниеМодификаций)
	РазделительПолей = " "; // Пробел
	СоставСтрокиЗаголовка = СтрРазделить(СтрокаЗаголовка, РазделительПолей);
	
	ИндексПоляИдентификатора = 0;
	Если Не МФПовтИсп.ЭтоСтрокаЗаголовкаОписанияМодификаций(СоставСтрокиЗаголовка[ИндексПоляИдентификатора]) Тогда // BSLLS:LineLength-off
		// BSLLS:NestedFunctionInParameters-off
		ТекстИсключения = СтрШаблон(
			НСтр("ru='Неправильный идентификатор заголовка описания модификации: ""%1""'"),
			СоставСтрокиЗаголовка[ИндексПоляИдентификатора]
		);
		// BSLLS:NestedFunctionInParameters-on
		
		ВызватьИсключение ТекстИсключения;
	КонецЕсли;
	
	КоличествоПолейЗаголовка = 3;
	Если СоставСтрокиЗаголовка.Количество() <> КоличествоПолейЗаголовка Тогда
		// BSLLS:NestedFunctionInParameters-off
		ТекстИсключения = СтрШаблон(
			НСтр("ru='Неправильное количество полей заголовка. Ожидалось: %1, обнаружено: %2'"),
			КоличествоПолейЗаголовка,
			СоставСтрокиЗаголовка.Количество()
		);
		// BSLLS:NestedFunctionInParameters-on
		
		ВызватьИсключение ТекстИсключения;
	КонецЕсли;
	
	ИндексПоляВерсии = 1;
	ОписаниеМодификаций.Версия = СоставСтрокиЗаголовка[ИндексПоляВерсии];
	
	ИндексПоляРазделитель = 2;
	КодСимволаРазделителя = МФПовтИсп
		.ТипНатуральноеЧисло()
		.ПривестиЗначение(СоставСтрокиЗаголовка[ИндексПоляРазделитель]);
	ОписаниеМодификаций.РазделительПолей = Символ(КодСимволаРазделителя);
КонецПроцедуры

Процедура ОбработатьСтрокиМакета(ОписаниеМодификаций, МакетОписанияМодификаций, ИндексСтрокиЗаголовка, Протокол)
	ИндексПервойСтрокиОписанияМодификаций = ИндексСтрокиЗаголовка + 1;
	Для Сч = ИндексПервойСтрокиОписанияМодификаций По МакетОписанияМодификаций.КоличествоСтрок() Цикл
		СтрокаДокумента = МакетОписанияМодификаций.ПолучитьСтроку(Сч);
		ОписаниеПолей = ОписаниеПолей(СтрокаДокумента, Сч, ОписаниеМодификаций.РазделительПолей);
		Попытка
			ОбработатьПоля(ОписаниеМодификаций, ОписаниеПолей);
		Исключение
			ИнформацияОбОшибке = ИнформацияОбОшибке();
			ОписаниеОшибки = НовыйОписаниеОшибки();
			ЗаполнитьОписаниеОшибкиИзИнформацииОбОшибке(ОписаниеОшибки, ИнформацияОбОшибке);
			ОписаниеОшибки.НомерСтрокиМакета = Сч;
			ОписаниеОшибки.СтрокаМакета = СтрокаДокумента;
			Протокол.ГенераторПротокола.ОбработатьОписаниеОшибки(Протокол, ОписаниеОшибки);
			Если Протокол.ПрерватьМодификациюПриОшибке Тогда
				ВызватьИсключение;
			КонецЕсли;
		КонецПопытки;
	КонецЦикла;
КонецПроцедуры

Функция ОписаниеПолей(СтрокаДокумента, НомерСтроки, РазделительПолей)
	Поля = Новый Массив;
	ЭлементыСтроки = СтрРазделить(СтрокаДокумента, РазделительПолей, Ложь);
	Для Каждого Элемент Из ЭлементыСтроки Цикл
		Поля.Добавить(СокрЛП(Элемент));
	КонецЦикла;
	
	Возврат Поля;
КонецФункции

#КонецОбласти

#Область ОбработкаПолей

Процедура ОбработатьПоля(ОписаниеМодификаций, ОписаниеПолей)
	Если ОписаниеПолей.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;
	
	Идентификатор = МФОбработкаСтрокСлужебный.Идентификатор(ОписаниеПолей[0]);
	ОбработчикиТиповСтрок = МФПовтИсп.ОбработчикиТиповСтрокОписанияМодификации();
	МодульОбработки = ОбработчикиТиповСтрок.Получить(Идентификатор);
	Если МодульОбработки <> Неопределено Тогда
		МодульОбработки.Обработать(ОписаниеМодификаций, ОписаниеПолей);
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#КонецОбласти

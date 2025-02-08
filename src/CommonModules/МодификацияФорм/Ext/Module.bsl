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

#Область ПрограммныйИнтерфейс

// Модификация формы согласно переданного макета
//
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Модифицируемая форма.
//  Отказ - Булево - Признак отказа от создания формы.
//  ИмяМакетаОписанияМодификаций - Строка - Путь к макету описания модификации. Формат пути:
//                                          "<Коллекция>.<Объект>.<Макет>", где:
//                                            * <Коллекция> - Имя коллекции метаданных, указывается во множественном числе;
//                                            * <Объект> - Имя объекта;
//                                            * <Макет> - Имя макета;
//                                          Например, "Обработки.ОписаниеМодификаций.ЗаказПоставщику".
//  ГенераторПротокола - ОбщийМодуль, Неопределено - См. дополнительно МФСлужебный.Протокол.
//
Процедура МодифицироватьФорму(Форма, Отказ, ИмяМакетаОписанияМодификаций, ГенераторПротокола = Неопределено) Экспорт
	Протокол = МФСлужебный.Протокол(ГенераторПротокола);
	
	Попытка
		ОписаниеМодификаций = МФСлужебный
			.ОписаниеМодификаций(ИмяМакетаОписанияМодификаций, Протокол)
		;
		
		ДополнительноОбработатьРеквизиты(ОписаниеМодификаций, Протокол);
		ДополнительноОбработатьЭлементы(ОписаниеМодификаций, Протокол, Форма);
		
		МодифицироватьРеквизиты(Форма, ОписаниеМодификаций, Протокол);
		МодифицироватьКоманды(Форма, ОписаниеМодификаций, Протокол);
		МодифицироватьЭлементы(Форма, ОписаниеМодификаций, Протокол);
	Исключение // BSLLS:MissingCodeTryCatchEx-off
		// Пустой блок, все ошибки перехвачены на предыдущих этапах
	КонецПопытки;
	
	Если Протокол.ПрерватьВыводФормыПриОшибкахМодификации Тогда
		Отказ = Истина;
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = НСтр("ru='Форма показана не будет из-за ошибок в модификации'");
		Сообщение.Сообщить();
	КонецЕсли;
	
	Если Протокол.ДанныеПротокола.Количество() > 0 Тогда
		Протокол.ГенераторПротокола.СформироватьТекстПротокола(Протокол, Форма);
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область ДополнительнаяОбработкаРеквизитов

Процедура ДополнительноОбработатьРеквизиты(ОписаниеМодификаций, Протокол)
	ОписаниеМодификацийРеквизитов = ОписаниеМодификаций.Реквизиты;
	ОписанияРеквизитовКУдалению = Новый Массив;
	Для Каждого Элемент Из ОписаниеМодификацийРеквизитов Цикл
		ИдентификаторРеквизита = Элемент.Ключ;
		ОписаниеРеквизита = Элемент.Значение;
		Если ОписаниеРеквизита.ТипыРеквизита.Количество() = 0 Тогда
			ОписанияРеквизитовКУдалению.Добавить(ИдентификаторРеквизита);
			// BSLLS:NestedFunctionInParameters-off
			СтрокаПротокола = СтрШаблон(
				НСтр("ru='Реквизит ""%1"" будет удален, т.к. отсутствует описание типа реквизита'"),
				ОписаниеРеквизита.ИмяРеквизита
			);
			// BSLLS:NestedFunctionInParameters-on
			Протокол.ГенераторПротокола.ДобавитьСтрокуВПротокол(Протокол, СтрокаПротокола);
		КонецЕсли;
	КонецЦикла;
	
	Для Каждого Элемент Из ОписанияРеквизитовКУдалению Цикл
		ОписаниеМодификацийРеквизитов.Удалить(Элемент);
	КонецЦикла;
КонецПроцедуры

#КонецОбласти

#Область ДополнительнаяОбработкаЭлементов

Процедура ДополнительноОбработатьЭлементы(ОписаниеМодификаций, Протокол, Форма)
	ЗаполнитьОбязательныеСвойстваСуществующихЭлементов(Форма.Элементы, ОписаниеМодификаций.Элементы);
	СформироватьЗначенияСвойствЭлементов(ОписаниеМодификаций, Протокол);
КонецПроцедуры

Процедура ЗаполнитьОбязательныеСвойстваСуществующихЭлементов(ЭлементыФормы, ОписанияЭлементов)
	Для Каждого ЭлементКоллекции Из ОписанияЭлементов Цикл
		ОписаниеЭлемента = ЭлементКоллекции.Значение;
		ЭлементФормы = ЭлементыФормы.Найти(ОписаниеЭлемента.ИмяЭлемента);
		Если ЭлементФормы = Неопределено Тогда
			Продолжить;
		КонецЕсли;
		ОписаниеТипаЭлемента = МФЭлементыФормыПовтИсп
			.ОписанияСвойств()
			.Получить(ОписаниеЭлемента.ТипЭлемента)
		;
		Для Каждого Элемент Из ОписаниеТипаЭлемента.ОбязательныеСвойства Цикл
			ИдентификаторСвойства = Элемент.Ключ;
			ОписаниеСвойства = ОписаниеТипаЭлемента.Свойства.Получить(ИдентификаторСвойства);
			ИмяСвойства = ОписаниеСвойства.ИмяСвойства;
			ОписаниеЭлемента.СвойстваЭлемента.Вставить(ИдентификаторСвойства, ЭлементФормы[ИмяСвойства]);
		КонецЦикла;
	КонецЦикла;
КонецПроцедуры

Процедура СформироватьЗначенияСвойствЭлементов(ОписаниеМодификаций, Протокол)
	ОписанияЭлементов = ОписаниеМодификаций.Элементы;
	Для Каждого ЭлементКоллекции Из ОписанияЭлементов Цикл
		ОписаниеЭлемента = ЭлементКоллекции.Значение;
		ЗначенияСвойствЭлемента = ЗначенияСвойствЭлемента(ОписаниеЭлемента, ОписаниеМодификаций, Протокол);
		
		Для Каждого Элемент Из ЗначенияСвойствЭлемента Цикл
			ИдентификаторСвойства = Элемент.Ключ;
			ЗначениеСвойства = Элемент.Значение;
			ОписаниеСвойства = МФЭлементыФормыПовтИсп
				.ОписанияСвойств()
				.Получить(ОписаниеЭлемента.ТипЭлемента)
				.Свойства
				.Получить(ИдентификаторСвойства)
			;
			Если ОписаниеСвойства = Неопределено Тогда
				Продолжить;
			КонецЕсли;
			ИмяСвойства = ОписаниеСвойства.ИмяСвойства;
			
			ОписаниеЭлемента.СвойстваЭлемента.Вставить(ИдентификаторСвойства, ЗначениеСвойства);
		КонецЦикла;
	КонецЦикла;
КонецПроцедуры

Функция ЗначенияСвойствЭлемента(ОписаниеЭлемента, ОписаниеМодификаций, Протокол)
	Результат = Новый Структура;
	
	Для Каждого ЭлементКоллекции Из ОписаниеЭлемента.СвойстваЭлемента Цикл
		Результат.Вставить(ЭлементКоллекции.Ключ, ЭлементКоллекции.Значение);
	КонецЦикла;
	
	ОписаниеСвойствЭлементаФормы = МФЭлементыФормыПовтИсп
		.ОписанияСвойств()
		.Получить(ОписаниеЭлемента.ТипЭлемента)
	;
	СвойстваКОбработке = Новый Структура(Новый ФиксированнаяСтруктура(ОписаниеЭлемента.ПредставленияСвойствЭлемента));
	
	ОбработатьОбязательныеСвойства(
		Результат, 
		ОписаниеЭлемента, 
		ОписаниеСвойствЭлементаФормы, 
		СвойстваКОбработке,
		ОписаниеМодификаций,
		Протокол
	);
	ОбработатьПрочиеСвойства(
		Результат, 
		ОписаниеЭлемента, 
		ОписаниеСвойствЭлементаФормы, 
		СвойстваКОбработке,
		ОписаниеМодификаций,
		Протокол
	);
	
	Возврат Результат;
КонецФункции

Процедура ОбработатьОбязательныеСвойства(
	ЗначенияСвойств, 
	ОписаниеЭлемента, 
	ОписаниеСвойствЭлементаФормы, 
	СвойстваКОбработке, 
	ОписаниеМодификаций, 
	Протокол
)
	Для Каждого Элемент Из ОписаниеСвойствЭлементаФормы.ОбязательныеСвойства Цикл
		ИдентификаторОбязательногоСвойства = Элемент.Ключ;
		Для Каждого Синоним Из Элемент.Значение.Синонимы Цикл
			Если Не СвойстваКОбработке.Свойство(Синоним) Тогда
				Продолжить;
			КонецЕсли;
			Попытка
				ДобавитьЗначениеСвойства(
					ЗначенияСвойств,
					ОписаниеЭлемента, 
					ИдентификаторОбязательногоСвойства, 
					СвойстваКОбработке[Синоним],
					ОписаниеМодификаций
				);
			Исключение
				ИнформацияОбОшибке = ИнформацияОбОшибке();
				Протокол.ГенераторПротокола.ДобавитьСтрокуВПротокол(Протокол, ИнформацияОбОшибке.Описание);
				Если Протокол.ПрерватьМодификациюПриОшибке Тогда
					ВызватьИсключение;
				КонецЕсли;
			КонецПопытки;
			СвойстваКОбработке.Удалить(Синоним);
		КонецЦикла;
	КонецЦикла;
КонецПроцедуры

Процедура ОбработатьПрочиеСвойства(
	ЗначенияСвойств, 
	ОписаниеЭлемента, 
	ОписаниеСвойствЭлементаФормы, 
	СвойстваКОбработке, 
	ОписаниеМодификаций, 
	Протокол
)
	Для Каждого Элемент Из СвойстваКОбработке Цикл
		ИдентификаторСвойства = ОписаниеСвойствЭлементаФормы.СоответствиеСвойств.Получить(Элемент.Ключ);
		Попытка
			ДобавитьЗначениеСвойства(
				ЗначенияСвойств,
				ОписаниеЭлемента, 
				ИдентификаторСвойства, 
				Элемент.Значение,
				ОписаниеМодификаций
			);
		Исключение
			ИнформацияОбОшибке = ИнформацияОбОшибке();
			Протокол.ГенераторПротокола.ДобавитьСтрокуВПротокол(Протокол, ИнформацияОбОшибке.Описание);
			Если Протокол.ПрерватьМодификациюПриОшибке Тогда
				ВызватьИсключение;
			КонецЕсли;
		КонецПопытки;
	КонецЦикла;
КонецПроцедуры

Процедура ДобавитьЗначениеСвойства(
	ЗначенияСвойств, 
	ОписаниеЭлемента, 
	ИдентификаторСвойства, 
	ПредставлениеЗначенияСвойства, 
	ОписаниеМодификаций
)
	ТипЭлемента = ОписаниеЭлемента.ТипЭлемента;
	ОписаниеСвойства = МФЭлементыФормыПовтИсп
		.ОписанияСвойств()
		.Получить(ТипЭлемента)
		.Свойства
		.Получить(ИдентификаторСвойства)
	;
	ВозможныеТипыСвойства = ОписаниеСвойства.ТипыСвойства;
	ТипСвойства = Неопределено;
	Для Каждого Элемент Из ВозможныеТипыСвойства Цикл
		Если 
			Элемент.ИмяПоля = Неопределено 
			Или (
				ЗначенияСвойств.Свойство(Элемент.ИмяПоля)
				И ЗначенияСвойств[Элемент.ИмяПоля] = Элемент.ЗначениеПоля
			)
		Тогда
			ТипСвойства = Элемент.Тип;
			Прервать;
		КонецЕсли;
	КонецЦикла;
	
	ОбработчикиТиповЗначенийСвойств = МФПовтИсп.ОбработчикиТиповЗначенийСвойств();
	МодульОбработки = ОбработчикиТиповЗначенийСвойств.Получить(ТипСвойства);
	Если МодульОбработки <> Неопределено Тогда
		ЗначениеСвойства = МодульОбработки.ЗначениеСвойства(ПредставлениеЗначенияСвойства, ОписаниеМодификаций);
	Иначе
		ВозможныеЗначения = МФПовтИсп.ЗначенияСтандартныхПеречислений().Получить(ТипСвойства);
		Если ВозможныеЗначения = Неопределено Тогда
			// BSLLS:NestedFunctionInParameters-off
			СтрокаИсключения = СтрШаблон(
				НСтр("ru='Невозможно обработать свойство ""%1"" с типом ""%2"" элемента ""%3""'"),
				ОписаниеСвойства.ИмяСвойства,
				ТипСвойства,
				ОписаниеЭлемента.ИмяЭлемента
			);
			// BSLLS:NestedFunctionInParameters-on
			
			ВызватьИсключение СтрокаИсключения;
		КонецЕсли;
		ЗначениеСвойства = ВозможныеЗначения.Получить(ВРег(ПредставлениеЗначенияСвойства));
	КонецЕсли;
	
	ЗначенияСвойств.Вставить(ИдентификаторСвойства, ЗначениеСвойства);
КонецПроцедуры

#КонецОбласти

#Область МодификацияРеквизитов

Процедура МодифицироватьРеквизиты(Форма, ОписаниеМодификаций, Протокол)
	ДобавляемыеРеквизиты = Новый Массив;
	Для Каждого Элемент Из ОписаниеМодификаций.Реквизиты Цикл
		ОписаниеРеквизита = Элемент.Значение;
		ИмяРеквизита = ОписаниеРеквизита.ИмяРеквизита;
		ТипыРеквизита = ОписаниеТипаРеквизитаПоСоответствию(ОписаниеРеквизита.ТипыРеквизита);
		НовыйРеквизит = Новый РеквизитФормы(ИмяРеквизита, ТипыРеквизита);
		
		ДобавляемыеРеквизиты.Добавить(НовыйРеквизит);
	КонецЦикла;
	
	Попытка
		Форма.ИзменитьРеквизиты(ДобавляемыеРеквизиты);
	Исключение
	
		ВызватьИсключение;
	КонецПопытки;
КонецПроцедуры

Функция ОписаниеТипаРеквизитаПоСоответствию(ТипыРеквизита)
	КвалификаторыЧисла = Неопределено;
	КвалификаторыСтроки = Неопределено;
	КвалификаторыДаты = Неопределено;
	КвалификаторыДвоичныхДанных = Неопределено;
	
	Типы = Новый Массив;
	Для Каждого ТипРеквизита Из ТипыРеквизита Цикл
		Для Каждого Элемент Из ТипРеквизита.Значение.Типы() Цикл
			Типы.Добавить(Элемент);
		КонецЦикла;
		КвалификаторыЧисла = УстановитьКвалификаторСПроверкой(
			КвалификаторыЧисла, 
			ТипРеквизита.Значение.КвалификаторыЧисла
		);
		КвалификаторыСтроки = УстановитьКвалификаторСПроверкой(
			КвалификаторыСтроки, 
			ТипРеквизита.Значение.КвалификаторыСтроки
		);
		КвалификаторыДаты = УстановитьКвалификаторСПроверкой(
			КвалификаторыДаты, 
			ТипРеквизита.Значение.КвалификаторыДаты
		);
		КвалификаторыДвоичныхДанных = УстановитьКвалификаторСПроверкой(
			КвалификаторыДвоичныхДанных, 
			ТипРеквизита.Значение.КвалификаторыДвоичныхДанных
		);
	КонецЦикла;
	
	Результат = Новый ОписаниеТипов(
		Типы,
		КвалификаторыЧисла,
		КвалификаторыСтроки,
		КвалификаторыДаты,
		КвалификаторыДвоичныхДанных
	);
	
	Возврат Результат;
КонецФункции

Функция УстановитьКвалификаторСПроверкой(СтароеЗначение, НовоеЗначение)
	Результат = СтароеЗначение;
	
	Если СтароеЗначение = Неопределено Тогда
		Результат = НовоеЗначение;
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

#КонецОбласти

#Область МодификацияКоманд

Процедура МодифицироватьКоманды(Форма, ОписаниеМодификаций, Протокол)
	Для Каждого Элемент Из ОписаниеМодификаций.Команды Цикл
		ОписаниеКоманды = Элемент.Значение;
		КомандаФормы = Форма.Команды.Найти(ОписаниеКоманды.Имя);
		Если КомандаФормы = Неопределено Тогда
			КомандаФормы = Форма.Команды.Добавить(ОписаниеКоманды.Имя);
		КонецЕсли;
		Попытка
			ЗаполнитьСПроверкойНаНеопределено(ОписаниеКоманды.Заголовок, КомандаФормы.Заголовок);
			ЗаполнитьСПроверкойНаНеопределено(ОписаниеКоманды.Действие, КомандаФормы.Действие);
		Исключение
			ИнформацияОбОшибке = ИнформацияОбОшибке();
			Протокол.ГенераторПротокола.ДобавитьСтрокуВПротокол(Протокол, ИнформацияОбОшибке.Описание);
			Если Протокол.ПрерватьМодификациюПриОшибке Тогда
				ВызватьИсключение;
			КонецЕсли;
		КонецПопытки;
	КонецЦикла;
КонецПроцедуры

Процедура ЗаполнитьСПроверкойНаНеопределено(Источник, Приемник)
	Если Источник <> Неопределено Тогда
		Приемник = Источник;
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область МодификацияЭлементов

Процедура МодифицироватьЭлементы(Форма, ОписаниеМодификаций, Протокол)
	КоллекцияЭлементов = КоллекцияЭлементовВПорядкеВывода(ОписаниеМодификаций);
	
	Для Каждого ЭлементКоллекции Из КоллекцияЭлементов Цикл
		ОписаниеЭлемента = ЭлементКоллекции;
		
		ЭлементФормы = Форма.Элементы.Найти(ОписаниеЭлемента.ИмяЭлемента);
		Родитель = Неопределено;
		ПоследующийЭлемент = Неопределено;
		// TODO 2025-01-29: Продумать новую схему переноса существующего элемента формы (issue: #6)
		Если ОписаниеЭлемента.ИмяРодителя <> Неопределено Тогда
			Родитель = РодительЭлемента(Форма, ОписаниеЭлемента);
		КонецЕсли;
		Если ОписаниеЭлемента.ИмяПоследующегоЭлемента <> Неопределено Тогда
			ПоследующийЭлемент = Форма.Элементы.Найти(ОписаниеЭлемента.ИмяПоследующегоЭлемента);
		КонецЕсли;
		
		Если ЭлементФормы <> Неопределено Тогда
			Если ТипЗнч(ЭлементФормы) <> ОписаниеЭлемента.ТипЭлемента Тогда
				// BSLLS:NestedFunctionInParameters-off
				СтрокаПротокола = СтрШаблон(
					Нстр("ru='Некорректный тип элемента ""%1"" ожидается ""%2"", обнаружено ""%3""'"),
					ОписаниеЭлемента.ИмяЭлемента,
					ТипЗнч(ЭлементФормы),
					ОписаниеЭлемента.ТипЭлемента
				);
				// BSLLS:NestedFunctionInParameters-on
				Протокол.ГенераторПротокола.ДобавитьСтрокуВПротокол(Протокол, СтрокаПротокола);
				Если Протокол.ПрерватьМодификациюПриОшибке Тогда
					ВызватьИсключение "";
				КонецЕсли;
				
				Продолжить;
			КонецЕсли;
			Если Родитель = Неопределено Тогда
				Родитель = ЭлементФормы.Родитель;
			КонецЕсли;
			Если
				ЭлементФормы.Родитель <> Родитель
				Или ПоследующийЭлемент <> Неопределено
			Тогда
				Форма.Элементы.Переместить(ЭлементФормы, Родитель, ПоследующийЭлемент);
			КонецЕсли;
		Иначе
			ЭлементФормы = Форма.Элементы.Вставить(
				ОписаниеЭлемента.ИмяЭлемента,
				ОписаниеЭлемента.ТипЭлемента,
				Родитель,
				ПоследующийЭлемент
			);
		КонецЕсли;
		
		// Установка свойств элемента
		Для Каждого СвойствоЭлемента Из ОписаниеЭлемента.СвойстваЭлемента Цикл
			Попытка
				ЭлементФормы[СвойствоЭлемента.Ключ] = СвойствоЭлемента.Значение;
			Исключение
				// BSLLS:NestedFunctionInParameters-off
				СтрокаПротокола = СтрШаблон(
					Нстр("ru='Ошибка установки значения ""%1"" свойства ""%2"" элемента ""%3""'"),
					СвойствоЭлемента.Значение,
					СвойствоЭлемента.Ключ,
					ОписаниеЭлемента.ИмяЭлемента
				);
				// BSLLS:NestedFunctionInParameters-on
				Протокол.ГенераторПротокола.ДобавитьСтрокуВПротокол(Протокол, СтрокаПротокола);
				
				Если Протокол.ПрерватьМодификациюПриОшибке Тогда
					ВызватьИсключение;
				КонецЕсли;
			КонецПопытки;
		КонецЦикла;
		
		// Установка обработчиков элемента
		// TODO 2024-12-05: Добавить обработку исключений при некорректной установке обработчика события элемента (issue: #7)
		Для Каждого Элемент Из ОписаниеЭлемента.ОбработчикиЭлемента Цикл
			ОписаниеОбработчика = Элемент.Значение;
			
			ЭлементФормы.УстановитьДействие(
				ОписаниеОбработчика.ИмяОбработчика, 
				ОписаниеОбработчика.ИмяПроцедурыОбработчика
			);
		КонецЦикла;
	КонецЦикла;
КонецПроцедуры

Функция КоллекцияЭлементовВПорядкеВывода(ОписаниеМодификаций)
	Результат = Новый Массив;
	
	Для Каждого ОписаниеЭлемента Из ОписаниеМодификаций.Элементы Цикл
		Результат.Добавить(ОписаниеЭлемента.Значение);
		// TODO: Добавить анализ на родителя и последующего элемента (issue: #8)
	КонецЦикла;
	
	Возврат Результат;
КонецФункции

Функция РодительЭлемента(Форма, ОписаниеЭлемента)
	Результат = Неопределено;
	ИдентификаторРодителя = ВРег(СокрЛП(ОписаниеЭлемента.ИмяРодителя));
	
	Если РодительНеФорма(ИдентификаторРодителя) Тогда
		Результат = Форма.Элементы.Найти(ОписаниеЭлемента.ИмяРодителя);
	КонецЕсли;
	
	Если Результат = Неопределено Тогда
		Результат = Форма;
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

Функция РодительНеФорма(ИдентификаторРодителя)
	Возврат Не (
		ИдентификаторРодителя = ""
		Или МФПовтИсп.ЭтоИдентификаторФормы(ИдентификаторРодителя)
	);
КонецФункции

#КонецОбласти

#КонецОбласти

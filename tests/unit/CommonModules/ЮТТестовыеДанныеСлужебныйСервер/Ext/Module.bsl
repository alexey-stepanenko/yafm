﻿//©///////////////////////////////////////////////////////////////////////////©//
//
//  Copyright 2021-2024 BIA-Technologies Limited Liability Company
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

Функция ЗагрузитьИзМакета(Макет, ОписанияТипов, КэшЗначений, ЗаменяемыеЗначения, ПараметрыЗаполнения, ТаблицаЗначений) Экспорт
	
	Таблица = ЗагрузитьВТаблицуИзМакета(Макет, ОписанияТипов, КэшЗначений, ЗаменяемыеЗначения, ПараметрыЗаполнения);
	
	Если ТаблицаЗначений Тогда
		Возврат Таблица;
	КонецЕсли;
	
	Реквизиты = СтрСоединить(ЮТКоллекции.ВыгрузитьЗначения(Таблица.Колонки, "Имя"), ",");
	Результат = Новый Массив(Таблица.Количество());
	
	Для Инд = 0 По Таблица.Количество() - 1 Цикл
		Запись = Новый Структура(Реквизиты);
		ЗаполнитьЗначенияСвойств(Запись, Таблица[Инд]);
		Результат[Инд] = Запись;
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

Функция ВыборкаИзТабличногоДокумента(ТабличныйДокумент) Экспорт
	
	Возврат ЗапросКТабличномуДокументу(ТабличныйДокумент).Выбрать();
	
КонецФункции

Функция ТаблицаИзТабличногоДокумента(ТабличныйДокумент) Экспорт
	
	Возврат ЗапросКТабличномуДокументу(ТабличныйДокумент).Выгрузить();
	
КонецФункции

Функция СоздатьЗапись(Менеджер, Данные, ПараметрыЗаписи, ВернутьОбъект) Экспорт
	
	ПараметрыЗаписи = ПараметрыЗаписи(ПараметрыЗаписи);
	
	Объект = НовыйОбъект(Менеджер, Данные, ПараметрыЗаписи.ДополнительныеСвойства, ПараметрыЗаписи.УникальныйИдентификаторСсылки);
	
	КлючЗаписи = ЗаписатьОбъект(Объект, ПараметрыЗаписи);
	ЮТТестовыеДанныеСлужебный.ДобавитьТестовуюЗапись(КлючЗаписи);
	
	Если ВернутьОбъект Тогда
		Возврат Объект;
	Иначе
		Возврат КлючЗаписи;
	КонецЕсли;
	
КонецФункции

Процедура ЗаписатьДвиженияРегистратора(Регистратор, Данные, МетаданныеРегистра, ПараметрыЗаписи) Экспорт
	
	Менеджер = ЮТОбщий.Менеджер(МетаданныеРегистра);
	НаборЗаписей = Менеджер.СоздатьНаборЗаписей();
	ПредставлениеРегистратора = Строка(Регистратор);
	
	ДатаРегистратора = ЮТЗапросы.ЗначениеРеквизита(Регистратор, "Дата");
	НаборЗаписей.Отбор.Регистратор.Установить(Регистратор);
	
	Для Каждого Строка Из Данные Цикл
	
		Запись = НаборЗаписей.Добавить();
		ЗаполнитьЗначенияСвойств(Запись, Строка);
		Если НЕ ЗначениеЗаполнено(Запись.Период) Тогда
			Запись.Период = ДатаРегистратора;
		КонецЕсли;
		
	КонецЦикла;
	
	Попытка
		НаборЗаписей.Записать();
	Исключение
		Сообщение = СтрШаблон("Не удалось записать движения `$1` для %2", МетаданныеРегистра.Имя, ПредставлениеРегистратора);
		ЮТРегистрацияОшибок.ДобавитьПояснениеОшибки(Сообщение);
		ВызватьИсключение;
	КонецПопытки;
	
КонецПроцедуры

Функция НовыйОбъект(Знач Менеджер, Данные, ДополнительныеСвойства, УникальныйИдентификаторСсылки) Экспорт
	
	ОписаниеОбъектаМетаданных = ЮТМетаданные.ОписаниеОбъектаМетаданных(Менеджер);
	Менеджер = ЮТОбщий.Менеджер(ОписаниеОбъектаМетаданных);
	
	ЭтоРегистр = ЮТМетаданные.ЭтоРегистр(ОписаниеОбъектаМетаданных);
	
	Объект = СоздатьОбъект(Менеджер, ОписаниеОбъектаМетаданных.ОписаниеТипа, Данные);
	
	Если ДополнительныеСвойства <> Неопределено Тогда
		ЮТКоллекции.ДополнитьСтруктуру(Объект.ДополнительныеСвойства, ДополнительныеСвойства);
	КонецЕсли;
	
	Если УникальныйИдентификаторСсылки <> Неопределено И ОписаниеОбъектаМетаданных.ОписаниеТипа.Ссылочный Тогда
		Ссылка = Менеджер.ПолучитьСсылку(УникальныйИдентификаторСсылки);
		Объект.УстановитьСсылкуНового(Ссылка);
	КонецЕсли;
	
	Если ЭтоРегистр Тогда
		ЗаполнитьНаборРегистра(Объект, Данные);
		Возврат Объект;
	КонецЕсли;
	
	ЗаполнитьЗначенияСвойств(Объект, Данные);
	
	Если ОписаниеОбъектаМетаданных.ОписаниеТипа.ТабличныеЧасти Тогда
		
		Для Каждого ОписаниеТабличнойЧасти Из ОписаниеОбъектаМетаданных.ТабличныеЧасти Цикл
			
			ИмяТабличнойЧасти = ОписаниеТабличнойЧасти.Ключ;
			Если НЕ Данные.Свойство(ИмяТабличнойЧасти) Тогда
				Продолжить;
			КонецЕсли;
			
			Для Каждого Запись Из Данные[ИмяТабличнойЧасти] Цикл
				Строка = Объект[ИмяТабличнойЧасти].Добавить();
				ЗаполнитьЗначенияСвойств(Строка, Запись);
			КонецЦикла;
			
		КонецЦикла;
		
	КонецЕсли;
	
	ЗаполнитьБазовыеРеквизиты(Объект, ОписаниеОбъектаМетаданных);
	
	Возврат Объект;
	
КонецФункции

Процедура Удалить(Ссылки, Привилегированно) Экспорт
	
	Если ТипЗнч(Ссылки) <> Тип("Массив") Тогда
		Ссылки = ЮТКоллекции.ЗначениеВМассиве(Ссылки);
	КонецЕсли;
	
	Ошибки = Новый Массив;
	
	Если Привилегированно И НЕ ПривилегированныйРежим() Тогда
		УстановитьПривилегированныйРежим(Истина);
	КонецЕсли;
	
	Для Каждого Ссылка Из Ссылки Цикл
		
		УдалитьСсылку(Ссылка, Ошибки);
		
	КонецЦикла;
	
	ОбновитьНумерациюОбъектов();
	
	Если ЗначениеЗаполнено(Ошибки) Тогда
		ВызватьИсключение СтрСоединить(Ошибки, Символы.ПС);
	КонецЕсли;
	
КонецПроцедуры

Функция ФикцияЗначенияБазы(ТипЗначения, РеквизитыЗаполнения) Экспорт
	
	ОбъектМетаданных = Метаданные.НайтиПоТипу(ТипЗначения);
	
	Если ОбъектМетаданных = Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Если Метаданные.Перечисления.Содержит(ОбъектМетаданных) Тогда
		
		Возврат СлучайноеЗначениеПеречисления(ОбъектМетаданных);
		
	КонецЕсли;
	
	ОписаниеОбъектаМетаданных = ЮТМетаданные.ОписаниеОбъектаМетаданных(ОбъектМетаданных);
	Менеджер = ЮТОбщий.Менеджер(ОбъектМетаданных);
	
	Объект = СоздатьОбъект(Менеджер, ОписаниеОбъектаМетаданных.ОписаниеТипа, РеквизитыЗаполнения);
	
	Если ЗначениеЗаполнено(РеквизитыЗаполнения) Тогда
		ЗаполнитьЗначенияСвойств(Объект, РеквизитыЗаполнения);
	КонецЕсли;
	
	ЗаполнитьБазовыеРеквизиты(Объект, ОписаниеОбъектаМетаданных);
	
	КлючЗаписи =  ЗаписатьОбъект(Объект, ПараметрыЗаписи());
	ЮТТестовыеДанныеСлужебный.ДобавитьТестовуюЗапись(КлючЗаписи);
	
	Возврат КлючЗаписи;
	
КонецФункции

Функция СлучайноеЗначениеПеречисления(Перечисление) Экспорт
	
	Менеджер = ЮТОбщий.Менеджер(Перечисление);
	
	НомерЗначения = ЮТТестовыеДанные.СлучайноеПоложительноеЧисло(Менеджер.Количество());
	Возврат Менеджер.Получить(НомерЗначения - 1);
	
КонецФункции

Функция СлучайноеПредопределенноеЗначение(Менеджер, Отбор) Экспорт
	
	ИмяТаблицы = ЮТМетаданные.НормализованноеИмяТаблицы(Менеджер);
	Условия = ЮТест.Предикат(Отбор)
		.Реквизит("Предопределенный").Равно(Истина);
	
	ОписаниеЗапроса = ЮТЗапросыСлужебныйКлиентСервер.ОписаниеЗапроса(ИмяТаблицы, Условия, "Ссылка");
	
	Данные = ЮТЗапросы.РезультатЗапроса(ОписаниеЗапроса);
	
	Если Данные.Количество() = 1 Тогда
		Значение = Данные[0].Ссылка;
	ИначеЕсли Данные.Количество() > 1 Тогда
		Индекс = ЮТест.Данные().СлучайноеЧисло(0, Данные.Количество() - 1);
		Значение = Данные[Индекс].Ссылка;
	Иначе
		Значение = Неопределено;
	КонецЕсли;
	
	Возврат Значение;
	
КонецФункции

Процедура УстановитьЗначенияРеквизитов(Ссылка, ЗначенияРеквизитов, ПараметрыЗаписи) Экспорт
	
	Объект = Ссылка.ПолучитьОбъект();
	ПараметрыЗаписи = ПараметрыЗаписи(ПараметрыЗаписи);
	
	Для Каждого Элемент Из ЗначенияРеквизитов Цикл
		Объект[Элемент.Ключ] = Элемент.Значение;
	КонецЦикла;
	
	ЗаписатьОбъект(Объект, ПараметрыЗаписи);
	
КонецПроцедуры

Процедура УстановитьФоновуюБлокировку(Блокировка, Длительность) Экспорт
	
	ОписаниеБлокировки = ОписаниеБлокировки(Блокировка);
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ОписаниеБлокировки, Длительность);
	
	Задание = ФоновыеЗадания.Выполнить("ЮТТестовыеДанныеСлужебныйСервер.УстановитьБлокировку", Параметры);
	
	Если Задание.Состояние = СостояниеФоновогоЗадания.Активно Тогда
		//@skip-check empty-except-statement
		Попытка
			ФоновыеЗадания.ОжидатьЗавершения(ЮТКоллекции.ЗначениеВМассиве(Задание), 1);
		Исключение
			// Исключение не интересно
		КонецПопытки;
		Задание = ФоновыеЗадания.НайтиПоУникальномуИдентификатору(Задание.УникальныйИдентификатор);
	КонецЕсли;
	
	Если Задание.Состояние = СостояниеФоновогоЗадания.ЗавершеноАварийно Тогда
		ВызватьИсключение Задание.ИнформацияОбОшибке;
	ИначеЕсли Задание.Состояние <> СостояниеФоновогоЗадания.Активно Тогда
		ВызватьИсключение "Фоновое задание с блокировкой завершилось";
	КонецЕсли;
	
КонецПроцедуры

Процедура УстановитьБлокировку(ОписаниеБлокировки, Длительность) Экспорт
	
	Блокировка = Новый БлокировкаДанных();
	
	Для Каждого ОписаниеЭлемента Из ОписаниеБлокировки Цикл
		Элемент = Блокировка.Добавить();
		ЗаполнитьЗначенияСвойств(Элемент, ОписаниеЭлемента, "Область, Режим");
		
		Для Каждого ОписаниеПоля Из ОписаниеЭлемента.Поля Цикл
			Элемент.УстановитьЗначение(ОписаниеПоля.Поле, ОписаниеПоля.Значение);
		КонецЦикла;
	КонецЦикла;
	
	// BSLLS:BeginTransactionBeforeTryCatch-off 
	// BSLLS:PairingBrokenTransaction-off
	// BSLLS:PairingBrokenTransaction-off
	НачатьТранзакцию(РежимУправленияБлокировкойДанных.Управляемый);
	// BSLLS:BeginTransactionBeforeTryCatch-on
	// BSLLS:PairingBrokenTransaction-on
	// BSLLS:PairingBrokenTransaction-on
	//@skip-check lock-out-of-try
	Блокировка.Заблокировать();
	ЮТОбщий.Пауза(Длительность);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ЗагрузитьВТаблицуИзМакета(Макет, ОписанияТипов, КэшЗначений, ЗаменяемыеЗначения, ПараметрыЗаполнения)
	
	ДанныеМакета = ДанныеМакета(Макет);
	ТипДанныхМакета = ТипЗнч(ДанныеМакета);
	
	Если ТипДанныхМакета = Тип("ТабличныйДокумент") Тогда
		Результат = ЗагрузитьДанныеИзТабличногоДокумента(ДанныеМакета, ОписанияТипов, ЗаменяемыеЗначения, КэшЗначений, ПараметрыЗаполнения);
	ИначеЕсли ТипДанныхМакета = Тип("ТекстовыйДокумент") ИЛИ ТипДанныхМакета = Тип("Строка") Тогда
		Результат = ЗагрузитьДанныеИзСтроки(ДанныеМакета, ОписанияТипов, ЗаменяемыеЗначения, КэшЗначений, ПараметрыЗаполнения);
	Иначе
		ВызватьИсключение "Макет должен быть либо табличным, либо текстовым документом";
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

Функция ЗагрузитьДанныеИзТабличногоДокумента(ДанныеМакета, ОписанияТипов, ЗаменяемыеЗначения, КэшЗначений, ПараметрыЗаполнения)
	
	КолонкиМакета = Новый Массив();
	Для Инд = 1 По ДанныеМакета.ШиринаТаблицы Цикл
		ИмяКолонки = ДанныеМакета.Область(1, Инд).Текст;
		КолонкиМакета.Добавить(ИмяКолонки);
	КонецЦикла;
	
	ПараметрыЗагрузки = ПараметрыЗагрузки(КолонкиМакета, ОписанияТипов, ЗаменяемыеЗначения, КэшЗначений, ПараметрыЗаполнения);
	
	Выборка = ВыборкаИзТабличногоДокумента(ДанныеМакета);
	
	Пока Выборка.Следующий() Цикл
		
		Строка = ПараметрыЗагрузки.Таблица.Добавить();
		
		Для Каждого ОписаниеКолонки Из ПараметрыЗагрузки.ОписаниеКолонок Цикл
			
			ЗначениеПредставления = Выборка[ОписаниеКолонки.Индекс];
			
			Если ПустаяСтрока(ЗначениеПредставления) Тогда
				Продолжить;
			КонецЕсли;
			
			Значение = ЗначениеЯчейки(Выборка,
									  ЗначениеПредставления,
									  ОписаниеКолонки,
									  ЗаменяемыеЗначения,
									  КэшЗначений,
									  ПараметрыЗагрузки.ПараметрыСоздания);
			Строка[ОписаниеКолонки.Имя] = Значение;
			
		КонецЦикла;
		
	КонецЦикла;
	
	Возврат ПараметрыЗагрузки.Таблица;
	
КонецФункции

Функция ЗагрузитьДанныеИзСтроки(ДанныеМакета, ОписанияТипов, ЗаменяемыеЗначения, КэшЗначений, ПараметрыЗаполнения)
	
	Разделитель = "|";
	ПараметрыИтератора = ПараметрыИтератора(ДанныеМакета);
	
	Пока СледующаяСтрока(ПараметрыИтератора) Цикл
		
		Строка = СокрЛП(ПараметрыИтератора.Строка);
		
		Если НЕ СтрНачинаетсяС(Строка, Разделитель) Тогда
			Продолжить;
		КонецЕсли;
		
		КолонкиМакета = ЮТСтроки.РазделитьСтроку(Строка, Разделитель);
		
		СледующаяСтрока(ПараметрыИтератора);
		Прервать;
		
	КонецЦикла;
	
	ПараметрыЗагрузки = ПараметрыЗагрузки(КолонкиМакета, ОписанияТипов, ЗаменяемыеЗначения, КэшЗначений, ПараметрыЗаполнения);
	
	Пока СледующаяСтрока(ПараметрыИтератора) Цикл
		
		Строка = СокрЛП(ПараметрыИтератора.Строка);
		
		Если ПустаяСтрока(Строка) Тогда
			Продолжить;
		ИначеЕсли НЕ СтрНачинаетсяС(Строка, Разделитель) Тогда
			Прервать;
		КонецЕсли;
		
		СтрокаДанных = ПараметрыЗагрузки.Таблица.Добавить();
		Блоки = ЮТСтроки.РазделитьСтроку(Строка, Разделитель);
		
		Для Каждого ОписаниеКолонки Из ПараметрыЗагрузки.ОписаниеКолонок Цикл
			
			ЗначениеПредставления = Блоки[ОписаниеКолонки.Индекс];
			
			Если ПустаяСтрока(ЗначениеПредставления) Тогда
				Продолжить;
			КонецЕсли;
			
			Значение = ЗначениеЯчейки(Блоки,
									  ЗначениеПредставления,
									  ОписаниеКолонки,
									  ЗаменяемыеЗначения,
									  КэшЗначений,
									  ПараметрыЗагрузки.ПараметрыСоздания);
			СтрокаДанных[ОписаниеКолонки.Имя] = Значение;
			
		КонецЦикла;
		
	КонецЦикла;
	
	Возврат ПараметрыЗагрузки.Таблица;
	
КонецФункции

Функция ПараметрыИтератора(Источник)
	
	ПараметрыЧтения = Новый Структура;
	
	ПараметрыЧтения.Вставить("ИзТекстовогоДокумента", Ложь);
	ПараметрыЧтения.Вставить("ИзЧтенияТекста", Ложь);
	ПараметрыЧтения.Вставить("ИзВыборки", Ложь);
	ПараметрыЧтения.Вставить("ДостиглиКонца", Ложь);
	ПараметрыЧтения.Вставить("Строка", Неопределено);
	
	ТипЗначения = ТипЗнч(Источник);
	
	Если ТипЗначения = Тип("ТекстовыйДокумент") Тогда
		ПараметрыЧтения.ИзТекстовогоДокумента = Истина;
		ПараметрыЧтения.Вставить("ТекстовыйДокумент", Источник);
		ПараметрыЧтения.Вставить("КоличествоСтрок", Источник.КоличествоСтрок());
		ПараметрыЧтения.Вставить("ИндексСтроки", 0);
	ИначеЕсли ТипЗначения = Тип("Строка") Тогда
		ПараметрыЧтения.ИзЧтенияТекста = Истина;
		Кодировка = КодировкаТекста.UTF8;
		Поток = ПолучитьДвоичныеДанныеИзСтроки(Источник, Кодировка).ОткрытьПотокДляЧтения();
		Чтение = Новый ЧтениеТекста(Поток, Кодировка);
		ПараметрыЧтения.Вставить("Чтение", Чтение);
		ПараметрыЧтения.Вставить("Поток", Поток);
	ИначеЕсли ТипЗначения = Тип("ВыборкаДанных") Тогда
		ПараметрыЧтения.ИзВыборки = Истина;
		ПараметрыЧтения.Вставить("Выборка", Источник);
	Иначе
		ВызватьИсключение ЮТИсключения.НекорректныеПараметрыМетода("ЗагрузитьИзМакета", "неподдерживаемый источник");
	КонецЕсли;
	
	Возврат ПараметрыЧтения;
	
КонецФункции

Функция СледующаяСтрока(ПараметрыЧтения)
	
	Если ПараметрыЧтения.ДостиглиКонца Тогда
		ВызватьИсключение "Построчное чтение уже завершено. Обнаружена попытка чтения завершенного потока";
	КонецЕсли;
	
	Если ПараметрыЧтения.ИзТекстовогоДокумента Тогда
		
		ЮТОбщий.Инкремент(ПараметрыЧтения.ИндексСтроки);
		Если ПараметрыЧтения.ИндексСтроки > ПараметрыЧтения.КоличествоСтрок Тогда
			ПараметрыЧтения.ДостиглиКонца = Истина;
			Возврат Ложь;
		КонецЕсли;
		ПараметрыЧтения.Строка = ПараметрыЧтения.ТекстовыйДокумент.ПолучитьСтроку(ПараметрыЧтения.ИндексСтроки);
		
	ИначеЕсли ПараметрыЧтения.ИзЧтенияТекста Тогда
		
		ПараметрыЧтения.Строка = ПараметрыЧтения.Чтение.ПрочитатьСтроку();
		
		Если ПараметрыЧтения.Строка = Неопределено Тогда
			ПараметрыЧтения.Чтение.Закрыть();
			ПараметрыЧтения.Поток.Закрыть();
			ПараметрыЧтения.ДостиглиКонца = Истина;
			Возврат Ложь;
		КонецЕсли;
		
	ИначеЕсли ПараметрыЧтения.ИзВыборки Тогда
		
		Если ПараметрыЧтения.Выборка.Следующий() Тогда
			ПараметрыЧтения.Строка = ПараметрыЧтения.Выборка;
		Иначе
			ПараметрыЧтения.ДостиглиКонца = Истина;
			ПараметрыЧтения.Строка = Неопределено;
			Возврат Ложь;
		КонецЕсли;
		
	Иначе
		ВызватьИсключение ЮТИсключения.НекорректныеПараметрыМетода("ЗагрузитьИзМакета", "Некорректные/неподдерживаемые параметры чтения");
		
	КонецЕсли;
	
	Возврат Истина;
	
КонецФункции

Функция ДанныеМакета(Макет)
	
	ТипПараметра = ТипЗнч(Макет);
	ДанныеМакета = Неопределено;
	
	ПараметрыСодержитДанные = ТипПараметра = Тип("ТабличныйДокумент")
							  ИЛИ ТипПараметра = Тип("ТекстовыйДокумент")
							  ИЛИ ТипПараметра = Тип("Строка") И СтрНачинаетсяС(Макет, "|");
	
	Если ПараметрыСодержитДанные Тогда
		ДанныеМакета = Макет;
	ИначеЕсли ТипПараметра = Тип("Строка") Тогда
		ДанныеМакета = ЮТОбщийСлужебныйВызовСервера.Макет(Макет);
	Иначе
		ВызватьИсключение ЮТИсключения.НеподдерживаемыйПараметрМетода("ЮТТестовыеДанныеВызовСервера.ДанныеМакета", Макет);
	КонецЕсли;
	
	Возврат ДанныеМакета;
	
КонецФункции

Функция ЗначениеЯчейки(СтрокаДанных, ЗначениеПредставления, ОписаниеКолонки, ЗаменяемыеЗначения, КэшЗначений, ПараметрыСоздания)
	
	Значение = ЗаменяемыеЗначения[ЗначениеПредставления];
	
	КэшироватьЗначение = Значение = Неопределено И ОписаниеКолонки.Менеджер <> Неопределено;
	
	Если КэшироватьЗначение Тогда
		Если КэшЗначений[ОписаниеКолонки.КлючТипаЗначения] = Неопределено Тогда
			КэшЗначений.Вставить(ОписаниеКолонки.КлючТипаЗначения, Новый Соответствие());
		Иначе
			Значение = КэшЗначений[ОписаниеКолонки.КлючТипаЗначения][ЗначениеПредставления];
		КонецЕсли;
	КонецЕсли;
	
	Если Значение <> Неопределено Тогда
		Возврат Значение;
	КонецЕсли;
	
	ЗначенияРеквизитов = ЗначенияРеквизитов(СтрокаДанных, ОписаниеКолонки, ЗаменяемыеЗначения, КэшЗначений, ПараметрыСоздания);
	Значение = ПривестиЗначениеКолонки(ОписаниеКолонки, ЗначениеПредставления, ЗначенияРеквизитов, ПараметрыСоздания);
	
	Если КэшироватьЗначение Тогда
		КэшЗначений[ОписаниеКолонки.КлючТипаЗначения].Вставить(ЗначениеПредставления, Значение);
	КонецЕсли;
	
	Возврат Значение;
	
КонецФункции

Процедура ПодготовитьПараметрыЗаполненияТаблицы(КэшЗначений, ЗаменяемыеЗначения, ПараметрыЗаполнения, Колонки)
	
	Если ЗаменяемыеЗначения = Неопределено Тогда
		ЗаменяемыеЗначения = Новый Соответствие;
	КонецЕсли;
	
	Если НЕ ЗначениеЗаполнено(КэшЗначений) Тогда
		КэшЗначений = Новый Соответствие;
	КонецЕсли;
	
	Для Каждого Колонка Из Колонки Цикл
		
		Если НЕ Колонка.Ссылочный Тогда
			Продолжить;
		КонецЕсли;
		
		Если КэшЗначений[Колонка.КлючТипаЗначения] = Неопределено Тогда
			КэшЗначений.Вставить(Колонка.КлючТипаЗначения, Новый Соответствие);
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

Функция ЗначенияРеквизитов(СтрокаТаблицы, ОписаниеКолонки, ЗаменяемыеЗначения, КэшЗначений, Параметры)
	
	ЗначенияРеквизитов = Новый Структура();
	
	Для Каждого ОписаниеВложеннойКолонки Из ОписаниеКолонки.ДополнительныеРеквизиты Цикл
		
		ПредставлениеЗначения = СтрокаТаблицы[ОписаниеВложеннойКолонки.Индекс];
		Если ПустаяСтрока(ПредставлениеЗначения) Тогда
			Продолжить;
		КонецЕсли;
		
		Значение = ЗначениеЯчейки(СтрокаТаблицы, ПредставлениеЗначения, ОписаниеВложеннойКолонки, ЗаменяемыеЗначения, КэшЗначений, Параметры);
		ЗначенияРеквизитов.Вставить(ОписаниеВложеннойКолонки.Имя, Значение);
		
	КонецЦикла;
	
	ОписаниеОбъектаМетаданных = ОписаниеКолонки.ОписаниеОбъектаМетаданных;
	
	Если ОписаниеОбъектаМетаданных <> Неопределено И ОписаниеОбъектаМетаданных.ОписаниеТипа.Имя = "Справочник" Тогда
		ИмяРеквизита = "Наименование";
		Если ОписаниеОбъектаМетаданных.Реквизиты.Свойство(ИмяРеквизита) = Неопределено Тогда
			ИмяРеквизита = "Код";
		КонецЕсли;
		ЗначенияРеквизитов.Вставить(ИмяРеквизита, СтрокаТаблицы[ОписаниеКолонки.Индекс]);
	КонецЕсли;
	
	Возврат ЗначенияРеквизитов;
	
КонецФункции

Функция ПривестиЗначениеКолонки(ОписаниеКолонки, ЗначениеПредставления, ЗначенияРеквизитов, ПараметрыЗаписи)
	
	Если ОписаниеКолонки.ЭтоПеречисление Тогда
		Значение = ОписаниеКолонки.Менеджер[ЗначениеПредставления];
	ИначеЕсли ОписаниеКолонки.Ссылочный Тогда
		Значение = СоздатьНовуюЗапись(ОписаниеКолонки, ЗначенияРеквизитов, ПараметрыЗаписи);
	ИначеЕсли ОписаниеКолонки.ЭтоДата Тогда
		Значение = ЮТПреобразованияСлужебный.ПривестиЗначениеКДате(ОписаниеКолонки.ОписаниеТипа, ЗначениеПредставления);
	ИначеЕсли ОписаниеКолонки.ЭтоЧисло Тогда
		Значение = ЮТПреобразованияСлужебный.ПривестиЗначениеКЧислу(ОписаниеКолонки.ОписаниеТипа, ЗначениеПредставления);
	Иначе
		Значение = ОписаниеКолонки.ОписаниеТипа.ПривестиЗначение(ЗначениеПредставления);
	КонецЕсли;
	
	Возврат Значение;
	
КонецФункции

Функция СоздатьНовуюЗапись(ОписаниеКолонки, ЗначенияРеквизитов, ПараметрыЗаписи)
	
	Конструктор = ЮТТестовыеДанные.КонструкторОбъекта(ОписаниеКолонки.Менеджер);
	
	Если ЗначениеЗаполнено(ЗначенияРеквизитов) Тогда
		Для Каждого ДанныеЗначения Из ЗначенияРеквизитов Цикл
			Конструктор.Установить(ДанныеЗначения.Ключ, ДанныеЗначения.Значение);
		КонецЦикла;
	КонецЕсли;
	
	Если ПараметрыЗаписи.ФикцияОбязательныхПолей Тогда
		Конструктор.ФикцияОбязательныхПолей();
	КонецЕсли;
	
	Возврат Конструктор.Записать( , ПараметрыЗаписи.ПараметрыЗаписи.ОбменДаннымиЗагрузка);
	
КонецФункции

Функция НоваяТаблица(ОписаниеКолонок)
	
	ТаблицаЗначений = Новый ТаблицаЗначений();
	
	Для Каждого ОписаниеКолонки Из ОписаниеКолонок Цикл
		ТаблицаЗначений.Колонки.Добавить(ОписаниеКолонки.Имя, ОписаниеКолонки.ОписаниеТипа);
	КонецЦикла;
	
	Возврат ТаблицаЗначений;
	
КонецФункции

Функция ПараметрыЗагрузки(КолонкиМакета, ОписанияТипов, ЗаменяемыеЗначения, КэшЗначений, ПараметрыЗаполнения)
	
	ОписаниеКолонок = ОписаниеКолонок(КолонкиМакета, ОписанияТипов);
	ПодготовитьПараметрыЗаполненияТаблицы(КэшЗначений, ЗаменяемыеЗначения, ПараметрыЗаполнения, ОписаниеКолонок);
	ПараметрыСоздания = ПараметрыЗаполнения.СозданиеОбъектовМетаданных;
	
	ТаблицаЗначений = НоваяТаблица(ОписаниеКолонок);
	
	ПараметрыЗагрузки = Новый Структура;
	
	ПараметрыЗагрузки.Вставить("ОписаниеКолонок", ОписаниеКолонок);
	ПараметрыЗагрузки.Вставить("ПараметрыСоздания", ПараметрыСоздания);
	ПараметрыЗагрузки.Вставить("Таблица", ТаблицаЗначений);
	
	Возврат ПараметрыЗагрузки;
	
КонецФункции

#Область ОписаниеКолонок

Функция ОписаниеКолонок(КолонкиМакета, ОписанияТипов)
	
	ОсновныеКолонки = ОсновныеКолонкиМакета(КолонкиМакета);
	
	Для Каждого Элемент Из ОписанияТипов Цикл
		
		Если НЕ ОсновныеКолонки.Свойство(Элемент.Ключ) Тогда
			
			Сообщение = СтрШаблон("Макет не содержит колонку `%1`", Элемент.Ключ);
			ВызватьИсключение Сообщение;
			
		КонецЕсли;
		
	КонецЦикла;
	
	Если ТипЗнч(ОписанияТипов) = Тип("Структура") Тогда
		ОписанияТипов = ЮТКоллекции.ВСоответствие(ОписанияТипов, "Ключ", "Значение");
	КонецЕсли;
	
	ЗагружаемыеКолонки = Новый Массив();
	
	Для Каждого Элемент Из ОсновныеКолонки Цикл
		
		ОписаниеТиповКолонки = ОписанияТипов[Элемент.Ключ];
		
		Если ОписаниеТиповКолонки = Неопределено Тогда
			Продолжить;
		КонецЕсли;
		
		ОсновнаяКолонка = Элемент.Значение;
		ЗагружаемыеКолонки.Добавить(ОсновнаяКолонка);
		
		ОсновнаяКолонка.ОписаниеТипа = ОписаниеТиповКолонки;
		ДозаполнитьОписаниеКолонки(ОсновнаяКолонка);
		
		ДополнительныеКолонки = ОсновнаяКолонка.ДополнительныеРеквизиты;
		ОсновнаяКолонка.ДополнительныеРеквизиты = Новый Массив();
		
		Для Каждого ВложеннаяКолонка Из ДополнительныеКолонки Цикл
			
			ВложеннаяКолонка.ОписаниеТипа = ОписаниеТипаВложеннойКолонки(ОписанияТипов, ОсновнаяКолонка, ВложеннаяКолонка);
			
			Если ВложеннаяКолонка.ОписаниеТипа = Неопределено Тогда
				Продолжить;
			КонецЕсли;
			
			ОсновнаяКолонка.ДополнительныеРеквизиты.Добавить(ВложеннаяКолонка);
			ДозаполнитьОписаниеКолонки(ВложеннаяКолонка);
			
		КонецЦикла;
		
		ОсновнаяКолонка.Составное = ЗначениеЗаполнено(ОсновнаяКолонка.ДополнительныеРеквизиты);
		
	КонецЦикла;
	
	Возврат ЗагружаемыеКолонки;
	
КонецФункции

Функция ОписаниеТипаВложеннойКолонки(ОписанияТипов, ОсновнаяКолонка, ВложеннаяКолонка)
	
	ПолноеИмя = СтрШаблон("%1.%2", ОсновнаяКолонка.Имя, ВложеннаяКолонка.Имя);
	ОписаниеТипа = ОписанияТипов[ПолноеИмя];
	
	Если ОписаниеТипа = Неопределено Тогда
		Реквизиты = ОсновнаяКолонка.ОписаниеОбъектаМетаданных.Реквизиты;
		
		Если Реквизиты.Свойство(ВложеннаяКолонка.Имя) Тогда
			ОписаниеТипа = Реквизиты[ВложеннаяКолонка.Имя].Тип;
		КонецЕсли;
	КонецЕсли;
	
	Возврат ОписаниеТипа;
	
КонецФункции

Функция ОписаниеКолонки(Индекс)
	
	ОписаниеКолонки = Новый Структура;
	ОписаниеКолонки.Вставить("Индекс", Индекс);
	ОписаниеКолонки.Вставить("Имя", "");
	
	ОписаниеКолонки.Вставить("ОписаниеТипа", Неопределено);
	ОписаниеКолонки.Вставить("ТипЗначения", Неопределено);
	ОписаниеКолонки.Вставить("Ссылочный", Ложь);
	ОписаниеКолонки.Вставить("ДополнительныеРеквизиты", Новый Массив());
	ОписаниеКолонки.Вставить("Составное", Ложь);
	ОписаниеКолонки.Вставить("Менеджер", Неопределено);
	ОписаниеКолонки.Вставить("КлючТипаЗначения", Неопределено);
	ОписаниеКолонки.Вставить("ОписаниеОбъектаМетаданных", Неопределено);
	ОписаниеКолонки.Вставить("ЭтоПеречисление", Ложь);
	ОписаниеКолонки.Вставить("ЭтоЧисло", Ложь);
	ОписаниеКолонки.Вставить("ЭтоДата", Ложь);
	
	Возврат ОписаниеКолонки;
	
КонецФункции

Функция ОсновныеКолонкиМакета(КолонкиМакета)
	
	ОсновныеКолонки = Новый Структура();
	
	ВторойУровеньВложенности = 2;
	
	// Сначала соберем основные колонки
	Для Инд = 0 По КолонкиМакета.ВГраница() Цикл
		
		ИмяКолонки = КолонкиМакета[Инд];
		ЧастиИмени = СтрРазделить(ИмяКолонки, ".");
		
		Если ПустаяСтрока(ИмяКолонки) ИЛИ ЧастиИмени.Количество() = ВторойУровеньВложенности Тогда
			Продолжить;
		ИначеЕсли ЧастиИмени.Количество() > ВторойУровеньВложенности Тогда
			Сообщение = СтрШаблон("Некорректное имя колонки макета `%1`, доступно использовать максимум 1 уровень вложенности", ИмяКолонки);
			ВызватьИсключение Сообщение;
		Иначе
			ОписаниеКолонки = ОписаниеКолонки(Инд);
			ОписаниеКолонки.Имя = ИмяКолонки;
			
			ОсновныеКолонки.Вставить(ИмяКолонки, ОписаниеКолонки);
		КонецЕсли;
		
	КонецЦикла;
	
	Для Инд = 0 По КолонкиМакета.ВГраница() Цикл
		
		ЧастиИмени = СтрРазделить(КолонкиМакета[Инд], ".");
		
		Если ЧастиИмени.Количество() <> ВторойУровеньВложенности Тогда
			Продолжить;
		КонецЕсли;
		
		Если НЕ ОсновныеКолонки.Свойство(ЧастиИмени[0]) Тогда
			Сообщение = СтрШаблон("Для колонки `%1` не найдена в макете основная колонка с именем `%2`", ИмяКолонки, ЧастиИмени[0]);
			ВызватьИсключение Сообщение;
		КонецЕсли;
		
		ОсновнаяКолонка = ОсновныеКолонки[ЧастиИмени[0]];
		ОписаниеКолонки = ОписаниеКолонки(Инд);
		ОписаниеКолонки.Имя = ЧастиИмени[1];
		
		ОсновнаяКолонка.ДополнительныеРеквизиты.Добавить(ОписаниеКолонки);
		
	КонецЦикла;
	
	Возврат ОсновныеКолонки;
	
КонецФункции

Процедура ДозаполнитьОписаниеКолонки(ОписаниеКолонки)
	
	ТипЗначения = ОписаниеКолонки.ОписаниеТипа.Типы()[0];
	ОписаниеКолонки.ТипЗначения = ТипЗначения;
	
	ОписаниеКолонки.Ссылочный = ЮТТипыДанныхСлужебный.ЭтоСсылочныйТип(ТипЗначения);
	ОписаниеКолонки.ЭтоЧисло = ТипЗначения = Тип("Число");
	ОписаниеКолонки.ЭтоДата = ТипЗначения = Тип("Дата");
	
	Если ОписаниеКолонки.Ссылочный Тогда
		ОписаниеКолонки.ОписаниеОбъектаМетаданных = ЮТМетаданные.ОписаниеОбъектаМетаданных(ТипЗначения);
		ОписаниеКолонки.ЭтоПеречисление = ЮТМетаданные.ЭтоПеречисление(ОписаниеКолонки.ОписаниеОбъектаМетаданных);
		ОписаниеКолонки.Менеджер = ЮТОбщий.Менеджер(ОписаниеКолонки.ОписаниеОбъектаМетаданных);
		ОписаниеКолонки.КлючТипаЗначения = ЮТТипыДанныхСлужебный.ИдентификаторТипа(ТипЗначения);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

Функция ЗапросКТабличномуДокументу(ТабличныйДокумент)
	
	ВсегоСтрок = ТабличныйДокумент.ВысотаТаблицы;
	ВсегоКолонок = ТабличныйДокумент.ШиринаТаблицы;
	
	Область = ТабличныйДокумент.Область(1, 1, ВсегоСтрок, ВсегоКолонок);
	
	ИсточникДанных = Новый ОписаниеИсточникаДанных(Область);
	ПостроительОтчета = Новый ПостроительОтчета;
	ПостроительОтчета.ИсточникДанных = ИсточникДанных;
	ПостроительОтчета.Выполнить();
	
	Возврат ПостроительОтчета.Результат;
	
КонецФункции

Функция СоздатьОбъект(Менеджер, ОписаниеТипа, Данные)
	
	Если ОписаниеТипа.Конструктор = "СоздатьЭлемент" Тогда
		
		ЭтоГруппа = ?(Данные = Неопределено, Ложь, ЮТКоллекции.ЗначениеСтруктуры(Данные, "ЭтоГруппа", Ложь));
		Если ЭтоГруппа Тогда
			Результат = Менеджер.СоздатьГруппу();
		Иначе
			Результат = Менеджер.СоздатьЭлемент();
		КонецЕсли;
		
	ИначеЕсли ОписаниеТипа.Конструктор = "СоздатьДокумент" Тогда
		Результат = Менеджер.СоздатьДокумент();
	ИначеЕсли ОписаниеТипа.Конструктор = "СоздатьСчет" Тогда
		Результат = Менеджер.СоздатьСчет();
	ИначеЕсли ОписаниеТипа.Конструктор = "СоздатьВидРасчета" Тогда
		Результат = Менеджер.СоздатьВидРасчета();
	ИначеЕсли ОписаниеТипа.Конструктор = "СоздатьУзел" Тогда
		Результат = Менеджер.СоздатьУзел();
	ИначеЕсли ОписаниеТипа.Конструктор = "СоздатьНаборЗаписей" Тогда
		Результат = Менеджер.СоздатьНаборЗаписей();
	ИначеЕсли ОписаниеТипа.Конструктор = "СоздатьМенеджерЗаписи" Тогда
		Результат = Менеджер.СоздатьМенеджерЗаписи();
	ИначеЕсли ОписаниеТипа.Конструктор = "СоздатьБизнесПроцесс" Тогда
		Результат = Менеджер.СоздатьБизнесПроцесс();
	ИначеЕсли ОписаниеТипа.Конструктор = "СоздатьЗадачу" Тогда
		Результат = Менеджер.СоздатьЗадачу();
	Иначе
		ВызватьИсключение СтрШаблон("Для %1 не поддерживается создание записей ИБ", ОписаниеТипа.Имя);
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

Функция ЗаписатьОбъект(Объект, ПараметрыЗаписи)
	
	Если ПараметрыЗаписи.ОбменДаннымиЗагрузка Тогда
		Объект.ОбменДанными.Загрузка = Истина;
	КонецЕсли;
	
	Попытка
		
		Если ПараметрыЗаписи.РежимЗаписи <> Неопределено Тогда
			Объект.Записать(ПараметрыЗаписи.РежимЗаписи);
		Иначе
			Объект.Записать();
		КонецЕсли;
		
		Если ПараметрыЗаписи.ОбменДаннымиЗагрузка Тогда
			Объект.ОбменДанными.Загрузка = Ложь;
		КонецЕсли;
		
		Возврат КлючЗаписи(Объект);
		
	Исключение
		
		ЮТРегистрацияОшибок.ДобавитьПояснениеОшибки(СтрШаблон("Не удалось записать объект `%1` (%2)", Объект, ТипЗнч(Объект)));
		ВызватьИсключение;
		
	КонецПопытки;
	
КонецФункции

Процедура ЗаполнитьБазовыеРеквизиты(Объект, ОписаниеОбъектаМетаданных)
	
	АнглийскийЯзык = ЮТОкружение.ИспользуетсяАнглийскийВстроенныйЯзык();
	ИмяТипаДокумент = ?(АнглийскийЯзык, "Document", "Документ");
	ИмяРеквизитаКод = ?(АнглийскийЯзык, "Code", "Код");
	ИмяРеквизитаНаименование = ?(АнглийскийЯзык, "Description", "Наименование");
	
	ОписаниеТипа = ОписаниеОбъектаМетаданных.ОписаниеТипа;
	Если ОписаниеТипа.Имя = ИмяТипаДокумент Тогда
		Если НЕ ЗначениеЗаполнено(Объект.Дата) Тогда
			Объект.Дата = ТекущаяДатаСеанса();
		КонецЕсли;
		Если НЕ ЗначениеЗаполнено(Объект.Номер) Тогда
			Объект.УстановитьНовыйНомер();
		КонецЕсли;
	КонецЕсли;
	
	УстановитьНовыйКод = ОписаниеОбъектаМетаданных.ОписаниеТипа.УстановитьНовыйКод
		И ОписаниеОбъектаМетаданных.Реквизиты.Свойство(ИмяРеквизитаКод)
		И ОписаниеОбъектаМетаданных.Реквизиты[ИмяРеквизитаКод].Обязательный
		И Не ЗначениеЗаполнено(Объект.Код);
	
	УстановитьНаименование = ОписаниеОбъектаМетаданных.Реквизиты.Свойство(ИмяРеквизитаНаименование)
		И ОписаниеОбъектаМетаданных.Реквизиты[ИмяРеквизитаНаименование].Обязательный
		И НЕ ЗначениеЗаполнено(Объект.Наименование);
	
	Если УстановитьНовыйКод Тогда
		Объект.УстановитьНовыйКод();
	КонецЕсли;
	
	Если УстановитьНаименование Тогда
		РеквизитНаименование = ОписаниеОбъектаМетаданных.Реквизиты[ИмяРеквизитаНаименование];
		Объект.Наименование = ЮТТестовыеДанные.Фикция(РеквизитНаименование.Тип);
	КонецЕсли;
	
КонецПроцедуры

Функция КлючЗаписи(Объект)
	
	ТипЗначения = ТипЗнч(Объект);
	
	Если ЮТТипыДанныхСлужебный.ЭтоТипОбъекта(ТипЗначения) Тогда
		
		Возврат Объект.Ссылка;
		
	ИначеЕсли ЮТТипыДанныхСлужебный.ЭтоМенеджерЗаписи(ТипЗначения) Тогда
		
		Описание = ЮТМетаданные.ОписаниеОбъектаМетаданных(Объект);
		
		КлючевыеРеквизиты = Новый Структура();
		Для Каждого Реквизит Из Описание.Реквизиты Цикл
			Если Реквизит.Значение.ЭтоКлюч Тогда
				КлючевыеРеквизиты.Вставить(Реквизит.Ключ, Объект[Реквизит.Ключ]);
			КонецЕсли;
		КонецЦикла;
		
		Менеджер = ЮТОбщий.Менеджер(Описание);
		Возврат Менеджер.СоздатьКлючЗаписи(КлючевыеРеквизиты);
		
	ИначеЕсли ЮТТипыДанныхСлужебный.ЭтоТипНабораЗаписей(ТипЗначения) Тогда
		
		КлючевыеРеквизиты = Новый Структура();
		
		Для Каждого ЭлементОтбора Из Объект.Отбор Цикл
			КлючевыеРеквизиты.Вставить(ЭлементОтбора.Имя, ЭлементОтбора.Значение);
		КонецЦикла;
		
		Менеджер = ЮТОбщий.Менеджер(Объект);
		Возврат Менеджер.СоздатьКлючЗаписи(КлючевыеРеквизиты);
		
	Иначе
		
		Сообщение = ЮТИсключения.НеподдерживаемыйПараметрМетода("ЮТТестовыеДанныеВызовСервера.КлючЗаписи", Объект);
		ВызватьИсключение Сообщение;
		
	КонецЕсли;
	
КонецФункции

Функция ПараметрыЗаписи(ВходящиеПараметрыЗаписи = Неопределено)
	
	Если ВходящиеПараметрыЗаписи = Неопределено Тогда
		Возврат ЮТОбщий.ПараметрыЗаписи();
	Иначе
		ПараметрыЗаписи = ЮТОбщий.ПараметрыЗаписи();
		ЗаполнитьЗначенияСвойств(ПараметрыЗаписи, ВходящиеПараметрыЗаписи);
		Возврат ПараметрыЗаписи;
	КонецЕсли;
	
КонецФункции

Процедура ЗаполнитьНаборРегистра(Набор, ДанныеЗаписи)
	
	Запись = Набор.Добавить();
	ЗаполнитьЗначенияСвойств(Запись, ДанныеЗаписи);
	
	Для Каждого ЭлементОтбора Из Набор.Отбор Цикл
		ЭлементОтбора.Установить(Запись[ЭлементОтбора.Имя]);
	КонецЦикла;
	
КонецПроцедуры

Процедура УдалитьСсылку(Значение, ОшибкиОбработки)
	
	ТипЗначения = ТипЗнч(Значение);
	
	Если Значение = Неопределено ИЛИ ЮТТипыДанныхСлужебный.ЭтоТипПеречисления(ТипЗначения) Тогда
		Возврат;
	КонецЕсли;
	
	Попытка
		
		Если ЮТТипыДанныхСлужебный.ЭтоТипОбъекта(ТипЗначения) Тогда
			Если НЕ Значение.ЭтоНовый() Тогда
				Значение.Прочитать();
				Значение.Удалить();
			КонецЕсли;
		ИначеЕсли ЮТТипыДанныхСлужебный.ЭтоСсылочныйТип(ТипЗначения) Тогда
			Объект = Значение.ПолучитьОбъект();
			Если Объект <> Неопределено Тогда
				Объект.Удалить();
			КонецЕсли;
		Иначе
			Менеджер = ЮТОбщий.Менеджер(ТипЗначения);
			Запись = Менеджер.СоздатьМенеджерЗаписи();
			ЗаполнитьЗначенияСвойств(Запись, Значение);
			Запись.Прочитать();
			Запись.Удалить();
		КонецЕсли;
		
	Исключение
		
		ОшибкиОбработки.Добавить(ЮТРегистрацияОшибокСлужебный.ПредставлениеОшибки("Удаление " + Значение, ИнформацияОбОшибке()));
		
	КонецПопытки;
	
КонецПроцедуры

Функция ОписаниеБлокировки(Блокировка)
	
	Описание = Новый Массив();
	
	Для Каждого Элемент Из Блокировка Цикл
		Описание.Добавить(ОписаниеЭлементаБлокировки(Элемент));
	КонецЦикла;
	
	Возврат Описание;
	
КонецФункции

Функция ОписаниеЭлементаБлокировки(ЭлементБлокировки)
	
	Описание = Новый Структура;
	Описание.Вставить("Область", ЭлементБлокировки.Область);
	Описание.Вставить("Режим", ЭлементБлокировки.Режим);
	Описание.Вставить("Поля", Новый Массив);
	
	Для Каждого Поле Из ЭлементБлокировки.Поля Цикл
		ОписаниеПоля = Новый Структура;
		ОписаниеПоля.Вставить("Поле", Поле.Поле);
		ОписаниеПоля.Вставить("Значение", Поле.Значение);
	КонецЦикла;
	
	Возврат Описание;
	
КонецФункции

#КонецОбласти

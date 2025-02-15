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

Процедура ФайлыПроекта(ПутьКФайлуПроекта, Обработчик) Экспорт
	
	ПараметрыИсполнения = ЮТАсинхроннаяОбработкаСлужебныйКлиент.ЦепочкаАсинхроннойОбработки();
	ПараметрыИсполнения.Вставить("ФинальныйОбработчик", Обработчик);
	
	КаталогПроекта = ЮТНастройкиВыполнения.КаталогПроекта();
	
	Если ПустаяСтрока(КаталогПроекта) Тогда
		Сообщение = "Не указан каталог проекта, необходимо указать каталог проекта в параметрах запуска";
		ПрерватьОбработку(Сообщение, ПараметрыИсполнения);
		Возврат;
	КонецЕсли;
	
	ПолныйПуть = ЮТФайлы.ОбъединитьПути(КаталогПроекта, ПутьКФайлуПроекта);
	
	ПараметрыИсполнения.Вставить("ПолныйПуть", ПолныйПуть);
	ПараметрыИсполнения.Вставить("ПутьКФайлуПроекта", ПутьКФайлуПроекта);
	
	ДобавитьОбработчикЦепочки(ПараметрыИсполнения, "ОбработчикПроверкиСуществования");
	ДобавитьОбработчикЦепочки(ПараметрыИсполнения, "ОбработчикПроверкиКаталога");
	ДобавитьОбработчикЦепочки(ПараметрыИсполнения, "ОбработчикРезультатовПоиска");
	ДобавитьОбработчикЦепочки(ПараметрыИсполнения, "ОбработчикПереместитьФайлы");
	ДобавитьОбработчикЦепочки(ПараметрыИсполнения, "ОбработчикПеремещения");
	ПараметрыИсполнения.Цепочка.Добавить(Обработчик);
	
	ЮТФайлы.Существует(ПолныйПуть, ЮТАсинхроннаяОбработкаСлужебныйКлиент.СледующийОбработчик(ПараметрыИсполнения));
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область ФайлыПроекта

Процедура ОбработчикПроверкиСуществования(Существует, Параметры) Экспорт
	
	Если НЕ Существует Тогда
		Сообщение = СтрШаблон("Файл/каталог проекта `%1` не существует", Параметры.ПутьКФайлуПроекта);
		ПрерватьОбработку(Сообщение, Параметры);
		Возврат;
	КонецЕсли;
	
	ЮТФайлы.ЭтоКаталог(Параметры.ПолныйПуть, ЮТАсинхроннаяОбработкаСлужебныйКлиент.СледующийОбработчик(Параметры));
	
КонецПроцедуры

Процедура ОбработчикПроверкиКаталога(ЭтоКаталог, Параметры) Экспорт
	
	Обработчик = ЮТАсинхроннаяОбработкаСлужебныйКлиент.СледующийОбработчик(Параметры);
	Если ЭтоКаталог Тогда
		НачатьПоискФайлов(Обработчик, Параметры.ПолныйПуть, "*.*", Истина);
	Иначе
		НачатьПоискФайлов(Обработчик, Параметры.ПолныйПуть);
	КонецЕсли;
	
КонецПроцедуры

Процедура ОбработчикРезультатовПоиска(НайденныеФайлы, Параметры) Экспорт
	
	Если НЕ ЗначениеЗаполнено(НайденныеФайлы) Тогда
		Сообщение = СтрШаблон("Не удалось найти файлы каталога проекта по пути `%1`", Параметры.ПутьКФайлуПроекта);
		ПрерватьОбработку(Сообщение, Параметры);
		Возврат;
	КонецЕсли;
	
	ПараметрыПроверки = Новый Структура("Файлы, Индекс, Параметры", НайденныеФайлы, НайденныеФайлы.ВГраница(), Параметры);
	ИсключитьКаталоги(Неопределено, ПараметрыПроверки);
	
КонецПроцедуры

Процедура ОбработчикПереместитьФайлы(НайденныеФайлы, Параметры) Экспорт
	
	ФайлыДляПеремещения = Новый Массив();
	
	Для Каждого Файл Из НайденныеФайлы Цикл
		ФайлыДляПеремещения.Добавить(Новый ОписаниеПередаваемогоФайла(Файл.ПолноеИмя));
	КонецЦикла;
	
	Обработчик = ЮТАсинхроннаяОбработкаСлужебныйКлиент.СледующийОбработчик(Параметры);
	НачатьПомещениеФайлов(Обработчик, ФайлыДляПеремещения, , Ложь);
	
КонецПроцедуры

Процедура ИсключитьКаталоги(ЭтоКаталог, ПараметрыПроверки) Экспорт
	
	Если ЭтоКаталог <> Неопределено Тогда
		
		Если ЭтоКаталог Тогда
			ПараметрыПроверки.Файлы.Удалить(ПараметрыПроверки.Индекс);
		КонецЕсли;
		ПараметрыПроверки.Индекс = ПараметрыПроверки.Индекс - 1;
		
	КонецЕсли;
	
	Если ПараметрыПроверки.Индекс < 0 Тогда
		ЮТАсинхроннаяОбработкаСлужебныйКлиент.ВызватьСледующийОбработчик(ПараметрыПроверки.Параметры, ПараметрыПроверки.Файлы);
		Возврат;
	КонецЕсли;
	
	Файл = ПараметрыПроверки.Файлы[ПараметрыПроверки.Индекс];
	Обработчик = Новый ОписаниеОповещения("ИсключитьКаталоги", ЭтотОбъект, ПараметрыПроверки);
	ЮТФайлы.ЭтоКаталог(Файл.ПолноеИмя, Обработчик);
	
КонецПроцедуры

Процедура ОбработчикПеремещения(ПомещенныеФайлы, Параметры) Экспорт
	
	Если НЕ ЗначениеЗаполнено(ПомещенныеФайлы) Тогда
		Сообщение = СтрШаблон("Не удалось передать на сервер файлы проекта из каталога `%1`", Параметры.ПутьКФайлуПроекта);
		ПрерватьОбработку(Сообщение, Параметры);
		Возврат;
	КонецЕсли;
	
	ОписаниеФайлов = Новый Массив;
	
	Для Каждого Файл Из ПомещенныеФайлы Цикл
		ОписаниеФайла = Новый Структура("Имя, Хранение, ПолноеИмя");
		ЗаполнитьЗначенияСвойств(ОписаниеФайла, Файл);
		ОписаниеФайлов.Добавить(ОписаниеФайла);
	КонецЦикла;
	
	РезультатПередачиФайлов = ЮТРазрешениеЗависимостейСлужебныйВызовСервера.ПоместитьФайлыВРабочийКаталог(ОписаниеФайлов);
	
	Результат = ЮТФабрикаСлужебный.РезультатРазрешенияЗависимости();
	Результат.Успешно = РезультатПередачиФайлов <> Неопределено;
	
	Если Результат.Успешно Тогда
		Результат.СохраняемыйКонтекстКлиент = Новый Структура("РабочийКаталог, ПолноеИмя",
															  ЮТНастройкиВыполнения.КаталогПроекта(),
															  Параметры.ПолныйПуть);
		
		Результат.СохраняемыйКонтекстСервер = РезультатПередачиФайлов;
		ПолноеИмяСервер = ЮТФайлы.ОбъединитьПути(Результат.СохраняемыйКонтекстСервер.РабочийКаталог, Параметры.ПутьКФайлуПроекта);
		Результат.СохраняемыйКонтекстСервер.Вставить("ПолноеИмя", ПолноеИмяСервер);
	КонецЕсли;
	
	ЮТАсинхроннаяОбработкаСлужебныйКлиент.ВызватьСледующийОбработчик(Параметры, Результат);
	
КонецПроцедуры

Процедура ПрерватьОбработку(Ошибка, Параметры)
	
	Обработчик = Параметры.ФинальныйОбработчик;
	Результат = ЮТФабрикаСлужебный.РезультатРазрешенияЗависимости();
	Результат.Ошибка = Ошибка;
	
	ЮТАсинхроннаяОбработкаСлужебныйКлиент.ВызватьОбработчик(Обработчик, Результат);
	
КонецПроцедуры

#КонецОбласти

Процедура ДобавитьОбработчикЦепочки(ПараметрыИсполнения, ИмяМетода)
	
	Обработчик = Новый ОписаниеОповещения(ИмяМетода, ЭтотОбъект, ПараметрыИсполнения);
	ПараметрыИсполнения.Цепочка.Добавить(Обработчик);
	
КонецПроцедуры

#КонецОбласти

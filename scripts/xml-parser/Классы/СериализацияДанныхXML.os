//    Copyright 2018 khorevaa
// 
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
// 
//        http://www.apache.org/licenses/LICENSE-2.0
// 
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

#Использовать logos

Перем Лог;
Перем ИмяПоследнегоАтрибута;
Перем УпроститьЭлементы;

Процедура ПриСозданииОбъекта(Упростить = Истина)

	УпроститьЭлементы = Истина;

	Если ЗначениеЗаполнено(Упростить) Тогда
		УпроститьЭлементы = Упростить;
	КонецЕсли;

	Лог = Логирование.ПолучитьЛог("oscript.lib.xml-parser");

КонецПроцедуры

// Выполняет чтение данных xml в соответствие
//
// Параметры:
//   ПутьКФайлу - Строка - путь к файлу с данными xml
//
//  Возвращаемое значение:
//   Соответствие, Структура - результат чтения данных xml
//
Функция ПрочитатьИзФайла(Знач ПутьКФайлу) Экспорт

	Чтение = Новый ЧтениеXML;
	Чтение.ОткрытьФайл(ПутьКФайлу);

	Результат = ПрочитатьXML(Чтение);

	Чтение.Закрыть();

	Возврат Результат;

КонецФункции

// Выполняет сериализацию данных в файла
//
// Параметры:
//   ДанныеЗаписиXML - Соответствие, Массив, Структура, Число, Строка. Дата - данные для сериализации в XML
//   ПутьКФайлу - Строка - путь к файлу с данными xml
//   ЗаписатьОбъявлениеXML - Булево - признак добавления записи объявления XML
//
Процедура ЗаписатьВФайл(ДанныеЗаписиXML, Знач ПутьКФайлу, Знач ЗаписатьОбъявлениеXML = Ложь) Экспорт

	ЗаписьXML = Новый ЗаписьXML;
	ЗаписьXML.ОткрытьФайл(ПутьКФайлу);

	Если ЗаписатьОбъявлениеXML Тогда
		ЗаписьXML.ЗаписатьОбъявлениеXML();
	КонецЕсли;

	ЗаписатьXML(ЗаписьXML, ДанныеЗаписиXML);

	ЗаписьXML.Закрыть();

КонецПроцедуры

// Выполняет чтение и десериализацию данных из XML
//
// Параметры:
//   ЧтениеXML - ЧтениеXML - <описание параметра>
//   ИмяКорневогоУзла - Строка - имя текущего узла, для вызова рекурсии
//
//  Возвращаемое значение:
//   Соответствие, Структура - результат чтения данных xml
//
Функция ПрочитатьXML(Знач ЧтениеXML, Знач ИмяКорневогоУзла = "") Экспорт

	РезультатЧтения = Новый Структура;
	Атрибуты = Новый Соответствие;
	Элементы = Новый Соответствие;

	РезультатЧтения.Вставить("_Атрибуты", Атрибуты);
	РезультатЧтения.Вставить("_Элементы", Элементы);

	Лог.Отладка("Начинаю чтение узла <%1> из XML.", ЧтениеXML.ЛокальноеИмя);

	ПрочитатьАтрибуты(ЧтениеXML, Атрибуты);

	Если Не ЧтениеXML.ТипУзла = ТипУзлаXML.КонецСущности Тогда
		ПрочитатьУзлы(ЧтениеXML, РезультатЧтения, ИмяКорневогоУзла);
	КонецЕсли;

	УпроститьРезультатЧтения(РезультатЧтения);

	Лог.Отладка("Чтение узла <%1> закончено.", ЧтениеXML.ЛокальноеИмя);

	Возврат РезультатЧтения;

КонецФункции

// Выполняет сериализацию данных в XML
//
// Параметры:
//   ЗаписьXML - ЗаписьXML - подготовленная запись ЗаписьXML
//   ДанныеЗаписиXML - Соответствие, Массив, Структура, Число, Строка. Дата - данные для сериализации в XM
//
Процедура ЗаписатьXML(Знач ЗаписьXML, Знач ДанныеЗаписиXML) Экспорт

	ЗаписатьЗначениеXML(ЗаписьXML, ДанныеЗаписиXML);

КонецПроцедуры

#Область Запись_данных_XML

Процедура ЗаписатьЗначениеXML(Знач ЗаписьXML, Знач ДанныеЗаписиXML, Знач ИмяКорневогоУзла = "")

	НачатьЗаписьЭлемента = НЕ ПустаяСтрока(ИмяКорневогоУзла);

	Если НачатьЗаписьЭлемента Тогда
		ЗаписьXML.ЗаписатьНачалоЭлемента(XMLСтрока(ИмяКорневогоУзла));
	КонецЕсли;

	ТипДанныеЗаписиXML = ТипЗнч(ДанныеЗаписиXML);

	Если ТипДанныеЗаписиXML = Тип("Массив") Тогда
		ЗаписатьМассивВXML(ЗаписьXML, ДанныеЗаписиXML);
	ИначеЕсли ТипДанныеЗаписиXML = Тип("Соответствие")
		ИЛИ ТипДанныеЗаписиXML = Тип("Структура") Тогда
		ЗаписатьСоответствиеВXML(ЗаписьXML, ДанныеЗаписиXML);
	ИначеЕсли ЭтоПростойТип(ТипДанныеЗаписиXML) Тогда

		ЗаписатьТекст(ЗаписьXML, ДанныеЗаписиXML);

	КонецЕсли;

	Если НачатьЗаписьЭлемента Тогда
		ЗаписьXML.ЗаписатьКонецЭлемента();
	КонецЕсли;

КонецПроцедуры

Функция ЭтоПростойТип(Знач ТипДанных)

	Возврат ТипДанных = Тип("Число")
			ИЛИ ТипДанных = Тип("Строка")
			ИЛИ ТипДанных = Тип("Булево")
			;

КонецФункции

Процедура ЗаписатьАтрибуты(ЗаписьXML, ДанныеАтрибутов)

	Если ДанныеАтрибутов.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;

	Для каждого КлючЗначение Из ДанныеАтрибутов Цикл

		ЗаписьXML.ЗаписатьАтрибут(XMLСтрока(КлючЗначение.Ключ), XMLСтрока(КлючЗначение.Значение));

	КонецЦикла;

КонецПроцедуры

Процедура ЗаписатьСекцияCDATA(ЗаписьXML, ДанныеСекцияCDATA)

	Если НЕ ЗначениеЗаполнено(ДанныеСекцияCDATA) Тогда
		Возврат;
	КонецЕсли;

	ЗаписьXML.ЗаписатьСекциюCDATA(ДанныеСекцияCDATA);

КонецПроцедуры

Процедура ЗаписатьКомментарий(ЗаписьXML, Комментарий)

	Если НЕ ЗначениеЗаполнено(Комментарий) Тогда
		Возврат;
	КонецЕсли;

	ЗаписьXML.ЗаписатьКомментарий(XMLСтрока(Комментарий));

КонецПроцедуры

Процедура ЗаписатьТекст(ЗаписьXML, Текст)

	Если НЕ ЗначениеЗаполнено(Текст) Тогда
		Возврат;
	КонецЕсли;

	ЗаписьXML.ЗаписатьТекст(XMLСтрока(Текст));

КонецПроцедуры

Процедура ЗаписатьМассивВXML(ЗаписьXML, Знач ДанныеМассива)

	Для каждого ЭлементМассива Из ДанныеМассива Цикл
		ЗаписатьЗначениеXML(ЗаписьXML, ЭлементМассива);
	КонецЦикла;

КонецПроцедуры

Процедура ЗаписатьСоответствиеВXML(ЗаписьXML, ДанныеСоответствия)

	Для каждого КлючЗначение Из ДанныеСоответствия Цикл

		Если КлючЗначение.Ключ = "_Атрибуты" Тогда
			ЗаписатьАтрибуты(ЗаписьXML, КлючЗначение.Значение);
			Продолжить;
		КонецЕсли;

		Если КлючЗначение.Ключ = "_Комментарий" Тогда
			ЗаписатьКомментарий(ЗаписьXML, КлючЗначение.Значение);
			Продолжить;
		КонецЕсли;

		Если КлючЗначение.Ключ = "_CDATA" Тогда
			ЗаписатьСекцияCDATA(ЗаписьXML, КлючЗначение.Значение);
			Продолжить;
		КонецЕсли;

		Если КлючЗначение.Ключ = "_Значение" Тогда
			ЗаписатьТекст(ЗаписьXML, КлючЗначение.Значение);
			Продолжить;
		КонецЕсли;

		Если КлючЗначение.Ключ = "_Элементы" Тогда
			ЗаписатьЗначениеXML(ЗаписьXML, КлючЗначение.Значение);
			Продолжить;
		КонецЕсли;

		ЗаписатьЗначениеXML(ЗаписьXML, КлючЗначение.Значение, КлючЗначение.Ключ);

	КонецЦикла;

КонецПроцедуры

#КонецОбласти

#Область Чтение_данных_XML

Процедура УпроститьРезультатЧтения(РезультатЧтения)

	Если НЕ УпроститьЭлементы Тогда
		Возврат;
	КонецЕсли;

	Если РезультатЧтения["_Атрибуты"].Количество() = 0 Тогда
		РезультатЧтения.Удалить("_Атрибуты");
	КонецЕсли;

	Если РезультатЧтения["_Элементы"].Количество() = 0 Тогда
		РезультатЧтения.Удалить("_Элементы");
	КонецЕсли;

	МожноУпростить = РезультатЧтения.Количество() = 1;

	Если МожноУпростить Тогда
		Если РезультатЧтения.Свойство("_Значение") Тогда
			РезультатЧтения = РезультатЧтения._Значение;
		ИначеЕсли РезультатЧтения.Свойство("_Элементы") Тогда
			РезультатЧтения = РезультатЧтения._Элементы;
		КонецЕсли;
	ИначеЕсли РезультатЧтения.Количество() = 0 Тогда
		РезультатЧтения = Неопределено;
	КонецЕсли;

КонецПроцедуры

Процедура ПрочитатьАтрибуты(Знач ЧтениеXML, Атрибуты)

	Если ЧтениеXML.КоличествоАтрибутов() = 0 Тогда
		ИмяПоследнегоАтрибута = Неопределено;
		Возврат;
	КонецЕсли;

	Для ИндексАтрибута = 0 По ЧтениеXML.КоличествоАтрибутов() - 1 Цикл

		ИмяАтрибута = ЧтениеXML.ИмяАтрибута(ИндексАтрибута);
		ЗначениеАтрибута = ЧтениеXML.ЗначениеАтрибута(ИмяАтрибута);

		Лог.Отладка("Прочитано значение <%1> атрибута <%2>", ЗначениеАтрибута, ИмяАтрибута);
		Атрибуты.Вставить(СокрЛП(ИмяАтрибута), СокрЛП(ЗначениеАтрибута));
		ИмяПоследнегоАтрибута = ЧтениеXML.Имя;
	КонецЦикла;

КонецПроцедуры

Процедура ПрочитатьУзлы(Знач ЧтениеXML, КорневойУзел, Знач ИмяКорневогоУзла)

	Пока ЧтениеXML.Прочитать() Цикл

		Лог.Отладка("Тип узла <%1>", ЧтениеXML.ТипУзла);
		Лог.Отладка("Имя узла <%1>", ЧтениеXML.ЛокальноеИмя);

		Если ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента
			// И ЧтениеXML.ЛокальноеИмя = ИмяКорневогоУзла Тогда
			И ЧтениеXML.Имя = ИмяКорневогоУзла Тогда
			Прервать;
		КонецЕсли;

		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда

			// ИмяНовогоУзла = ЧтениеXML.ЛокальноеИмя;
			ИмяНовогоУзла = ЧтениеXML.Имя;
			Лог.Отладка("Новый узел <%1>", ИмяНовогоУзла);
			СоответствиеУзла = ПрочитатьXML(ЧтениеXML, ИмяНовогоУзла);
			ВставитьЭлементУзла(КорневойУзел, ИмяНовогоУзла, СоответствиеУзла);

		ИначеЕсли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда

			ЗначениеСвойства = ЧтениеXML.Значение;
			Лог.Отладка("Прочитано значение " + ЗначениеСвойства);
			КорневойУзел.Вставить("_Значение", ЗначениеСвойства);

		ИначеЕсли ЧтениеXML.ТипУзла = ТипУзлаXML.Комментарий Тогда
			ЗначениеСвойства = ЧтениеXML.Значение;
			Лог.Отладка("Прочитан комментарий " + ЗначениеСвойства);
			КорневойУзел.Вставить("_Комментарий", ЗначениеСвойства);

		ИначеЕсли ЧтениеXML.ТипУзла = ТипУзлаXML.СекцияCDATA Тогда
			ЗначениеСвойства = ЧтениеXML.Значение;
			Лог.Отладка("Прочитана СекцияCDATA " + ЗначениеСвойства);
			КорневойУзел.Вставить("_CDATA", ЗначениеСвойства);

		КонецЕсли;

	КонецЦикла;

КонецПроцедуры

Процедура ВставитьЭлементУзла(КорневойУзел, Знач ИмяНовогоУзла, СоответствиеУзла)

	ТипЭлементовУзла = ТипЗнч(КорневойУзел._Элементы);
	СоответствиеТекущегоЭлемента = Новый Соответствие();
	СоответствиеТекущегоЭлемента.Вставить(ИмяНовогоУзла, СоответствиеУзла);

	Если ТипЭлементовУзла = Тип("Массив") Тогда
		КорневойУзел._Элементы.Добавить(СоответствиеТекущегоЭлемента);
	ИначеЕсли ТипЭлементовУзла = Тип("Соответствие") Тогда

		УжеЕстьЗначение = НЕ КорневойУзел._Элементы[ИмяНовогоУзла] = Неопределено;

		Если УжеЕстьЗначение Тогда
			МассивЭлементов = Новый Массив;

			Для каждого КлючЗначение Из КорневойУзел._Элементы Цикл
				ТекущийЭлемент = Новый Соответствие();
				ТекущийЭлемент.Вставить(КлючЗначение.Ключ, КлючЗначение.Значение);
				МассивЭлементов.Добавить(ТекущийЭлемент);
			КонецЦикла;


			МассивЭлементов.Добавить(СоответствиеТекущегоЭлемента);

			КорневойУзел._Элементы  = МассивЭлементов;

		Иначе

			СоответствиеТекущегоЭлемента = Новый Соответствие();
			КорневойУзел._Элементы.Вставить(ИмяНовогоУзла, СоответствиеУзла);

		КонецЕсли;
	Иначе

		ВызватьИсключение СтрШаблон("Пришел не корректный тип значения <%1>", ТипЭлементовУзла);

	КонецЕсли;

КонецПроцедуры

#КонецОбласти
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

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Тогда

#Область ОписаниеПеременных

// см. ЮТКонструкторТестовыхДанныхСлужебный.НовыйКонтекстКонструктора
Перем Контекст;

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Устанавливает значение реквизита создаваемого объекта.
// 
// Если метод вызывается после вызова см. ТабличнаяЧасть, то устанавливается значение реквизита строки табличной части 
// 
// Параметры:
//  ИмяРеквизита - Строка - Имя реквизита объекта или табличной части
//  Значение - Произвольный - Значение реквизита объекта или табличной части
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТКонструкторТестовыхДанных - Конструктор
Функция Установить(ИмяРеквизита, Значение) Экспорт
	
	ЮТКонструкторТестовыхДанныхСлужебный.Установить(Контекст, ИмяРеквизита, Значение);
	Возврат ЭтотОбъект;
	
КонецФункции

// Устанавливает значения реквизитов создаваемого объекта.
// 
// Если метод вызывается после вызова см. ТабличнаяЧасть, то устанавливаются значения реквизитов строки табличной части 
// 
// Параметры:
//  ЗначенияРеквизитов - Структура - Устанавливаемые значения реквизитов
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТКонструкторТестовыхДанных - Установить реквизиты
Функция УстановитьРеквизиты(ЗначенияРеквизитов) Экспорт
	
	ЮТКонструкторТестовыхДанныхСлужебный.УстановитьРеквизиты(Контекст, ЗначенияРеквизитов);
	Возврат ЭтотОбъект;
	
КонецФункции

// Устанавливает фиктивное значение реквизита создаваемого объекта.
// 
// Если метод вызывается после вызова см. ТабличнаяЧасть, то устанавливается значение реквизита строки табличной части.
// 
// На основании менеджера и имени реквизита вычисляется его тип, а по типу генерируется фиктивное значение.
// 
// * Для примитивных значение генерируется случайное значение
// * Для ссылочных типов создается новый объект
// * Для перечислений (в том числе системных) выбирается случайно значение перечисления
// 
// Параметры:
//  ИмяРеквизита - Строка - Имя реквизита объекта или табличной части
//  РеквизитыЗаполнения - Структура - Значения реквизитов заполнения создаваемого объекта базы
//                      - Неопределено
//  ОграничениеТипа - Тип, ОписаниеТипов - Испольуется для ограничения типа составного реквизита, будет сгерерировано значение указанного типа
//                  - Неопределено - Будет сгенерировано значение, на основании типа реквизита,
//                                   если реквизит составной, то будет использован случайный тип
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТКонструкторТестовыхДанных - Конструктор
Функция Фикция(ИмяРеквизита, РеквизитыЗаполнения = Неопределено, ОграничениеТипа = Неопределено) Экспорт
	
	ЮТКонструкторТестовыхДанныхСлужебный.Фикция(Контекст, ИмяРеквизита, РеквизитыЗаполнения, ОграничениеТипа);
	Возврат ЭтотОбъект;
	
КонецФункции

// Устанавливает фиктивные значения реквизитов создаваемого объекта.
// 
// Если метод вызывается после вызова см. ТабличнаяЧасть, то устанавливается значения реквизитов строки табличной части.
// 
// На основании менеджера и имени реквизита вычисляется его тип, а по типу генерируется фиктивное значение.
// 
// * Для примитивных значение генерируется случайное значение
// * Для ссылочных типов создается новый объект
// * Для перечислений (в том числе системных) выбирается случайно значение перечисления
// 
// Параметры:
//  ИменаРеквизитов - Строка - Имена реквизитов объекта или табличной части разделенные запятыми
//                  - Массив из Строка - Имена реквизитов объекта или табличной части
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТКонструкторТестовыхДанных - Конструктор
Функция ФикцияРеквизитов(ИменаРеквизитов) Экспорт
	
	ЮТКонструкторТестовыхДанныхСлужебный.ФикцияРеквизитов(Контекст, ИменаРеквизитов);
	Возврат ЭтотОбъект;
	
КонецФункции

// Заполняет обязательные поля объекта фиктивными значениями
// 
// Если метод вызывается после вызова см. ТабличнаяЧасть, то устанавливаются значения реквизитов строки табличной части.
// 
// На основании метаданных определяются обязательные поля (Проверка заполнения = Выдавать ошибку),
// для них генерируются и устанавливаются фиктивные значение.
// 
// * Для примитивных значение генерируется случайное значение
// * Для ссылочных типов создается новый объект
// * Для перечислений (в том числе системных) выбирается случайно значение перечисления
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТКонструкторТестовыхДанных - Конструктор
Функция ФикцияОбязательныхПолей() Экспорт
	
	ЮТКонструкторТестовыхДанныхСлужебный.ФикцияОбязательныхПолей(Контекст);
	Возврат ЭтотОбъект;
	
КонецФункции

// Переключает конструктор на заполнение табличной части объекта.
// 
// Параметры:
//  ИмяТабличнойЧасти - Строка - Имя табличной части
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТКонструкторТестовыхДанных - Конструктор
Функция ТабличнаяЧасть(ИмяТабличнойЧасти) Экспорт
	
	ЮТКонструкторТестовыхДанныхСлужебный.ТабличнаяЧасть(Контекст, ИмяТабличнойЧасти);
	Возврат ЭтотОбъект;
	
КонецФункции

// Переключает конструктор на заполнение объекта.
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТКонструкторТестовыхДанных - Конструктор
Функция Объект() Экспорт
	
	ЮТКонструкторТестовыхДанныхСлужебный.ТабличнаяЧасть(Контекст, Неопределено);
	Возврат ЭтотОбъект;
	
КонецФункции

// Добавляет новую строку табличной части объекта.
// При необходимости можно выполнить установку реквизитов новой строки
// 
// Параметры:
//  ЗначенияРеквизитов - Структура - Устанавливаемые значения реквизитов новой строки
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТКонструкторТестовыхДанных - Конструктор
Функция ДобавитьСтроку(ЗначенияРеквизитов = Неопределено) Экспорт
	
	ЮТКонструкторТестовыхДанныхСлужебный.ДобавитьСтроку(Контекст, ЗначенияРеквизитов);
	Возврат ЭтотОбъект;
	
КонецФункции

// Устанавливает дополнительное свойство объекта.
// 
// Параметры:
//  ИмяСвойства - Строка - Имя дополнительного свойства
//  Значение - Произвольный - Значение дополнительного свойства
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТКонструкторТестовыхДанных - Конструктор
Функция УстановитьДополнительноеСвойство(ИмяСвойства, Значение = Неопределено) Экспорт
	
	ЮТКонструкторТестовыхДанныхСлужебный.УстановитьДополнительноеСвойство(Контекст, ИмяСвойства, Значение);
	Возврат ЭтотОбъект;
	
КонецФункции

// Устанавливает дополнительное свойство объекта.
// 
// Параметры:
//  Значение - УникальныйИдентификатор - Уникальный идентификатор ссылки нового объекта
//           - Строка - Строковое представление уникального идентификатора ссылки нового объекта
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТКонструкторТестовыхДанных - Конструктор
Функция УстановитьСсылкуНового(Значение) Экспорт
	
	ЮТКонструкторТестовыхДанныхСлужебный.УстановитьСсылкуНового(Контекст, Значение);
	Возврат ЭтотОбъект;
	
КонецФункции

// Создает новый объект и возвращает его или ссылку.
// 
// Важно, после создания данные не очищаются, поэтому многократный вызов метода создаст множество одинаковых объектов.
// Если вы хотите создать полностью новый объект, необходимо по-новой инициировать конструктор.
// 
// Параметры:
//  ВернутьОбъект - Булево - Вернуть объект вместо ссылки
//  ОбменДаннымиЗагрузка - Булево - Записать объект с признаком `ОбменДанными.Загрузка = Истина`
// 
// Возвращаемое значение:
//  Произвольный - Созданный объект или ссылка на него
Функция Записать(ВернутьОбъект = Ложь, ОбменДаннымиЗагрузка = Ложь) Экспорт
	
	Возврат ЮТКонструкторТестовыхДанныхСлужебный.Записать(Контекст, ВернутьОбъект, ОбменДаннымиЗагрузка);
	
КонецФункции

// Создает новый объект.
// 
// Важно, после создания данные не очищаются, поэтому многократный вызов метода создаст множество одинаковых объектов.
// Если вы хотите создать полностью новый объект, необходимо по-новой инициировать конструктор.
// 
// Параметры:
//  ОбменДаннымиЗагрузка - Булево - Записать объект с признаком `ОбменДанными.Загрузка = Истина`
// 
// Возвращаемое значение:
//  ОбработкаОбъект.ЮТКонструкторТестовыхДанных - Конструктор
Функция ДобавитьЗапись(ОбменДаннымиЗагрузка = Ложь) Экспорт
	
	ЮТКонструкторТестовыхДанныхСлужебный.Записать(Контекст, Ложь, ОбменДаннымиЗагрузка);
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Создает и возвращяет новый объект (не записывая его).
// 
// Важно, после создания данные не очищаются, поэтому многократный вызов метода создаст множество одинаковых объектов.
// Если вы хотите создать полностью новый объект, необходимо по-новой инициировать конструктор.
// 
// Возвращаемое значение:
//  Произвольный - Созданный объект.
Функция НовыйОбъект() Экспорт
	
	Возврат ЮТКонструкторТестовыхДанныхСлужебный.НовыйОбъект(Контекст);
	
КонецФункции

// Создает и проводит новый документ. Возвращает объект или или ссылку на него.
// 
// Важно, после создания данные не очищаются, поэтому многократный вызов метода создаст множество одинаковых объектов.
// Если вы хотите создать полностью новый объект, необходимо по-новой инициировать конструктор.
// 
// Параметры:
//  ВернутьОбъект - Булево - Вернуть объект вместо ссылки
// 
// Возвращаемое значение:
//  Произвольный - Созданный объект или ссылка на него
Функция Провести(ВернутьОбъект = Ложь) Экспорт
	
	Возврат ЮТКонструкторТестовыхДанныхСлужебный.Провести(Контекст, ВернутьОбъект);
	
КонецФункции

// Возвращает данные текущей строки табличной части объекта.
// 
// Возвращаемое значение:
//  - Структура - Данные строки
//  - Неопределено - Если заполняется объект
Функция ДанныеСтроки() Экспорт
	
	Возврат ЮТКонструкторТестовыхДанныхСлужебный.ДанныеСтрокиТабличнойЧасти(Контекст);
	
КонецФункции

// Возвращает данные создаваемого объекта.
// 
// Возвращаемое значение:
//  Структура - Данные объекта
Функция ДанныеОбъекта() Экспорт
	
	Возврат ЮТКонструкторТестовыхДанныхСлужебный.ДанныеОбъекта(Контекст);
	
КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Процедура Инициализировать(Менеджер) Экспорт
	
	Контекст = ЮТКонструкторТестовыхДанныхСлужебный.НовыйКонтекстКонструктора(Менеджер);
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли

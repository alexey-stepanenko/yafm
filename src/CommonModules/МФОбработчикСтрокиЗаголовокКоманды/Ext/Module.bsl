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

Функция Идентификаторы() Экспорт
	Идентификаторы = Новый Массив;
	Идентификаторы.Добавить("ЗАГОЛОВОККОМАНДЫ");
	
	Возврат Идентификаторы;
КонецФункции

// Обработчик строки, описывающий заголовок команды
//
// Параметры:
//  ОписаниеМодификаций - Структура - См. подробнее МодификацияФормСлужебный.НовыйОписаниеМодификаций()
//  Поля - Массив - значения полей из строки описания модификации формы. Ожидается 3 элемента массива:
//    * [0] - Идентификатор строки. Может содержать значения из массива, возвращаемого функцией Идентификаторы().
//    * [1] - Имя команды.
//    * [2] - Заголовок команды.
//
// Пример строки:
//  ЗАГОЛОВОККОМАНДЫ	НоваяКоманда1	Новая команда 1
//
Процедура Обработать(ОписаниеМодификаций, Поля) Экспорт
	МинимальноеКоличествоПолей = 3;
	КоличествоПолей = Поля.Количество();
	МФОбработкаСтрокСлужебный.ПроверитьКоличествоПолейСтроки(КоличествоПолей, МинимальноеКоличествоПолей);
	
	СоставПолейСтроки = МФОбработкаСтрокСлужебный.СоставПолейСтроки(Поля, "Имя,Заголовок");
	
	Если Не ОписаниеМодификаций.Команды.Свойство(СоставПолейСтроки.Идентификатор) Тогда
		// BSLLS:NestedFunctionInParameters-off
		ТекстИсключения = СтрШаблон(
			НСтр("ru='Отсутствует описание команды ""%1""'"),
			СоставПолейСтроки.Имя
		);
		// BSLLS:NestedFunctionInParameters-on
		
		ВызватьИсключение ТекстИсключения;
	КонецЕсли;
	
	Описание = ОписаниеМодификаций.Команды[СоставПолейСтроки.Идентификатор];
	Описание.Заголовок = СоставПолейСтроки.Заголовок;
КонецПроцедуры

#КонецОбласти

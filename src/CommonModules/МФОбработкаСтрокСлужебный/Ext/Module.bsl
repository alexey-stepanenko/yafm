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

Процедура ПроверитьКоличествоПолейСтроки(КоличествоПолей, МинимальноеКоличествоПолей) Экспорт
	Если КоличествоПолей < МинимальноеКоличествоПолей Тогда
		// BSLLS:NestedFunctionInParameters-off
		ТекстИсключения = СтрШаблон(
			НСтр("ru='Неправильный формат описания: ожидается полей %1, указано полей %2'"),
			МинимальноеКоличествоПолей, 
			КоличествоПолей
		);
		// BSLLS:NestedFunctionInParameters-on
		
		ВызватьИсключение ТекстИсключения;
	КонецЕсли;
КонецПроцедуры

Функция СоставПолейСтроки(Поля, ИменаПолейСтрокой) Экспорт
	Результат = Новый Структура;
	
	ИменаПолей = СтрРазделить(ИменаПолейСтрокой, ",");
	КоличествоПолей = Мин(Поля.Количество() - 1, ИменаПолей.Количество());
	Для Сч = 0 По КоличествоПолей - 1 Цикл
		Результат.Вставить(ИменаПолей[Сч], Поля[Сч + 1]);
	КонецЦикла;
	
	Если Результат.Свойство("Имя") Тогда
		// BSLLS:NestedFunctionInParameters-off
		Результат.Вставить(
			"Идентификатор", 
			ВРег(Результат.Имя)
		);
		// BSLLS:NestedFunctionInParameters-on
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

Функция Идентификатор(ИсходноеЗначение) Экспорт
	Возврат ВРег(ИсходноеЗначение);
КонецФункции

Функция ОписаниеТипаИзСтроки(ОписаниеТипаСтрокой) Экспорт
	ТипЗначения = Неопределено;
	ИдентификаторТипа = Неопределено;
	
	Попытка
		ИдентификаторТипаЧисло = "ЧИСЛО";
		ИдентификаторТипаСтрока = "СТРОКА";
		// TODO: Добавить обработку типов "Дата", "ДвоичныеДанные" (issue: #18)
		Если ОписаниеТипаСоответствуетИдентификатору(ОписаниеТипаСтрокой, ИдентификаторТипаЧисло) Тогда
			ДополнительныеПараметрыТипа = ДополнительныеПараметрыТипа(ОписаниеТипаСтрокой, ИдентификаторТипаЧисло);
			ТипЗначения = ТипЧисло(ДополнительныеПараметрыТипа);
			ИдентификаторТипа = ИдентификаторТипаЧисло;
		ИначеЕсли ОписаниеТипаСоответствуетИдентификатору(ОписаниеТипаСтрокой, ИдентификаторТипаСтрока) Тогда
			ДополнительныеПараметрыТипа = ДополнительныеПараметрыТипа(ОписаниеТипаСтрокой, ИдентификаторТипаСтрока);
			ТипЗначения = ТипСтрока(ДополнительныеПараметрыТипа);
			ИдентификаторТипа = ИдентификаторТипаСтрока;
		Иначе
			ТипЗначения = ПрочийТип(ОписаниеТипаСтрокой);
			ИдентификаторТипа = МФОбработкаСтрокСлужебный.Идентификатор(ОписаниеТипаСтрокой);
		КонецЕсли;
		
		Результат = Новый Структура;
		Результат.Вставить("Тип", ТипЗначения);
		Результат.Вставить("ИдентификаторТипа", ИдентификаторТипа);
	Исключение
		// BSLLS:NestedFunctionInParameters-off
		ТекстИсключения = СтрШаблон(
			НСтр("ru='Ошибка преобразования типа ""%1""'"), 
			ОписаниеТипаСтрокой
		);
		// BSLLS:NestedFunctionInParameters-on
		
		ВызватьИсключение ТекстИсключения;
	КонецПопытки;
	
	Возврат Результат;
КонецФункции

#КонецОбласти

#Область ОписаниеТипаИзСтроки

Функция ОписаниеТипаСоответствуетИдентификатору(ОписаниеТипаСтрокой, ИдентификаторТипа)
	Возврат Идентификатор(Лев(ОписаниеТипаСтрокой, СтрДлина(ИдентификаторТипа))) = ИдентификаторТипа;
КонецФункции

Функция ДополнительныеПараметрыТипа(ОписаниеТипаСтрокой, ИдентификаторТипа)
	// BSLLS:NestedFunctionInParameters-off
	Результат = Прав(
		ОписаниеТипаСтрокой, 
		СтрДлина(ОписаниеТипаСтрокой) - СтрДлина(ИдентификаторТипа)
	);
	// BSLLS:NestedFunctionInParameters-on
	
	Возврат Результат;
КонецФункции

Функция ТипЧисло(ДополнительныеПараметрыТипа)
	ОписаниеТипаНатуральноеЧисло = МФПовтИсп.ТипНатуральноеЧисло();
	Длина = 0;
	Точность = 0;
	ПараметрыЧисла = СтрРазделить(ДополнительныеПараметрыТипа, ".");
	Длина = ОписаниеТипаНатуральноеЧисло.ПривестиЗначение(ПараметрыЧисла[0]);
	Если ПараметрыЧисла.Количество() > 1 Тогда
		Точность = ОписаниеТипаНатуральноеЧисло.ПривестиЗначение(ПараметрыЧисла[1]);
	КонецЕсли;
	
	Возврат Новый ОписаниеТипов("Число", Новый КвалификаторыЧисла(Длина, Точность));
КонецФункции

Функция ТипСтрока(ДополнительныеПараметрыТипа)
	ОписаниеТипаНатуральноеЧисло = МФПовтИсп.ТипНатуральноеЧисло();
	ДлинаСтроки = ОписаниеТипаНатуральноеЧисло.ПривестиЗначение(ДополнительныеПараметрыТипа);
	
	Возврат Новый ОписаниеТипов("Строка", , Новый КвалификаторыСтроки(ДлинаСтроки));
КонецФункции

Функция ПрочийТип(ИмяТипа)
	Возврат Новый ОписаниеТипов(ИмяТипа);
КонецФункции

#КонецОбласти

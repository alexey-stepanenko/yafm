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

Функция НовыйОписаниеСвойствЭлемента() Экспорт
	Результат = Новый Структура;
	Результат.Вставить("Свойства", Новый Соответствие);
	Результат.Вставить("СоответствиеСвойств", Новый Соответствие);
	Результат.Вставить("Разделы", Разделы());
	Результат.Вставить("ОбязательныеСвойства", Новый Соответствие);
	
	Возврат Результат;
КонецФункции

Процедура ДобавитьЗависимость(Зависимости, ИмяЗависимости, Знач ИмяПоля, Знач ЗначениеПоля) Экспорт
	Если ТипЗнч(ИмяПоля) = Тип("Строка") Тогда
		ИмяПоля = ВРег(ИмяПоля);
	КонецЕсли;
	Зависимость = Новый Структура(
		"ИдентификаторПоля, ЗначениеПоля",
		ИмяПоля,
		ЗначениеПоля
	);
	
	Зависимости.Вставить(ИмяЗависимости, Зависимость);
КонецПроцедуры

Функция ИмяСвойстваВид() Экспорт 
	Возврат "Type";
КонецФункции

Процедура ДобавитьОписаниеСвойстваЭлементаФормы(
	ОписанияСвойствЭлементов, 
	ИменаСвойстваСтрокой, 
	ИмяРаздела, 
	ЗависимостиТиповСвойства, 
	ЗначенияТиповСвойства
) Экспорт
	ИндексОсновногоИмени = 0;
	ИменаСвойств = СтрРазделить(ИменаСвойстваСтрокой, ",");
	ИмяСвойства = СокрЛП(ИменаСвойств[ИндексОсновногоИмени]);
	ИдентификаторСвойства = ВРег(ИмяСвойства);
	
	Для Каждого Элемент Из ИменаСвойств Цикл
		ОписанияСвойствЭлементов.СоответствиеСвойств.Вставить(ВРег(СокрЛП(Элемент)), ИдентификаторСвойства);
	КонецЦикла;
	
	ОписаниеСвойства = НовыйОписаниеСвойства();
	ОписаниеСвойства.ИмяСвойства = ИмяСвойства;
	
	Если ТипЗнч(ЗависимостиТиповСвойства) <> Тип("Массив") Тогда
		СписокЗависимостей = Новый Массив;
		СписокЗависимостей.Добавить(ЗависимостиТиповСвойства);
		СписокТипов = Новый Массив;
		СписокТипов.Добавить(ЗначенияТиповСвойства);
	Иначе
		СписокЗависимостей = ЗависимостиТиповСвойства;
		Если ТипЗнч(ЗначенияТиповСвойства) = Тип("Массив") Тогда
			СписокТипов = ЗначенияТиповСвойства;
		Иначе
			СписокТипов = Новый Массив;
			Для Сч = 1 По СписокЗависимостей.Количество() Цикл
				СписокТипов.Добавить(ЗначенияТиповСвойства);
			КонецЦикла;
		КонецЕсли;
	КонецЕсли;
	
	ТипыСвойства = Новый Массив;
	Для Сч = 0 По СписокЗависимостей.Количество() - 1 Цикл
		ДобавитьТипСвойства(
			ТипыСвойства, 
			СписокЗависимостей[Сч].ИдентификаторПоля,
			СписокЗависимостей[Сч].ЗначениеПоля,
			СписокТипов[Сч]
		);
	КонецЦикла;
	
	ОписаниеСвойства.ТипыСвойства = ТипыСвойства;
	
	ОписанияСвойствЭлементов.Свойства.Вставить(ИдентификаторСвойства, ОписаниеСвойства);
	ОписанияСвойствЭлементов.Разделы[ИмяРаздела].Добавить(ИдентификаторСвойства);
КонецПроцедуры

Процедура ДобавитьОбязательноеСвойство(ОписанияСвойствЭлемента, ИмяСвойства, ЗначениеПоУмолчанию = Неопределено) Экспорт
	ОписаниеОбязательногоСвойства = Новый Структура;
	ОписаниеОбязательногоСвойства.Вставить("ЗначениеПоУмолчанию", ЗначениеПоУмолчанию);
	ОписаниеОбязательногоСвойства.Вставить("Синонимы", Новый Массив);
	ОписанияСвойствЭлемента.ОбязательныеСвойства.Вставить(ВРег(СокрЛП(ИмяСвойства)), ОписаниеОбязательногоСвойства);
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция Разделы()
	Результат = Новый Соответствие;
	
	Результат.Вставить(МФПовтИсп.РазделОсновные(), Новый Массив);
	Результат.Вставить(МФПовтИсп.РазделДанные(), Новый Массив);
	Результат.Вставить(МФПовтИсп.РазделИспользование(), Новый Массив);
	Результат.Вставить(МФПовтИсп.РазделОформление(), Новый Массив);
	Результат.Вставить(МФПовтИсп.РазделРасположение(), Новый Массив);
	Результат.Вставить(МФПовтИсп.РазделСобытия(), Новый Массив);
	
	Возврат Результат;
КонецФункции

Функция НовыйОписаниеСвойства()
	Результат = Новый Структура;
	
	Результат.Вставить("ИмяСвойства", Неопределено);
	Результат.Вставить("ТипыСвойства", Неопределено);
	
	Возврат Результат;
КонецФункции

Процедура ДобавитьТипСвойства(ТипыСвойства, ИмяПоля, ЗначениеПоля, Тип)
	Зависимость = Новый Структура;
	Зависимость.Вставить("ИмяПоля", ИмяПоля);
	Зависимость.Вставить("ЗначениеПоля", ЗначениеПоля);
	Зависимость.Вставить("Тип", Тип);
	
	ТипыСвойства.Добавить(Зависимость);
КонецПроцедуры

#КонецОбласти

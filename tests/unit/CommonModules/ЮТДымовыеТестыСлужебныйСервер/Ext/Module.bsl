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

Функция СлучайныйЭлемент(ТипОбъекта, ИмяОбъекта, Параметры = Неопределено) Экспорт
	
	МаксимальныйНомерЭлемента = 100;
	ПолноеИмя = СтрШаблон("%1.%2", ТипОбъекта, ИмяОбъекта);
	ОписаниеОбъектаМетаданных = ЮТМетаданные.ОписаниеОбъектаМетаданных(ПолноеИмя);
	
	Запрос = Новый Запрос;
	
	РеквизитУпорядочивания = РеквизитУпорядочивания(ОписаниеОбъектаМетаданных);
	ВыбираемыеПоля = ВыбираемыеПоля(ОписаниеОбъектаМетаданных, РеквизитУпорядочивания);
	Условия = Условия(Параметры, ОписаниеОбъектаМетаданных, Запрос);
	Реквизиты = СтрСоединить(ВыбираемыеПоля, ", ");
	НомерЭлемента = ЮТТестовыеДанные.СлучайноеПоложительноеЧисло(МаксимальныйНомерЭлемента);
	
	// BSLLS:QueryParseError-off
	Запрос.Текст = СтрШаблон(
	"ВЫБРАТЬ РАЗРЕШЕННЫЕ ПЕРВЫЕ 1
	|	*
	|ИЗ
	|	(ВЫБРАТЬ ПЕРВЫЕ %1
	|		%2
	|	ИЗ
	|		%3 КАК Выборка
	|	%4
	|	УПОРЯДОЧИТЬ ПО
	|		%5 УБЫВ) КАК ВЫБОРКА
	|
	|УПОРЯДОЧИТЬ ПО
	|	%5", НомерЭлемента, Реквизиты, ПолноеИмя, Условия, РеквизитУпорядочивания);
	// BSLLS:QueryParseError-on
	
	ЗначенияРеквизитов = ЮТЗапросыСлужебныйВызовСервера.ЗначенияИзЗапроса(Запрос, Реквизиты);
	
	Если ОписаниеОбъектаМетаданных.ОписаниеТипа.Ссылочный Тогда
		Возврат ЗначенияРеквизитов.Ссылка;
	Иначе
		Возврат ЗначенияРеквизитов;
	КонецЕсли;
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция РеквизитУпорядочивания(ОписаниеОбъектаМетаданных)
	
	Если ЮТМетаданные.ЭтоДокумент(ОписаниеОбъектаМетаданных) Тогда
		Возврат "Дата";
	ИначеЕсли ОписаниеОбъектаМетаданных.ОписаниеТипа.Ссылочный Тогда
		Возврат "Ссылка";
	КонецЕсли;
	
	Возврат Неопределено;
	
КонецФункции

Функция Условия(Параметры, ОписаниеОбъектаМетаданных, Запрос)
	
	Условия = "";
	
	Если Параметры <> Неопределено И Параметры.Свойство("Отбор") Тогда
		
		ДоступныГруппы = (ЮТМетаданные.ЭтоСправочник(ОписаниеОбъектаМетаданных)
			Или ЮТМетаданные.ЭтоПланВидовХарактеристик(ОписаниеОбъектаМетаданных))
			И ОписаниеОбъектаМетаданных.Реквизиты.Свойство("ЭтоГруппа");
		
		Для Каждого Элемент Из Параметры.Отбор Цикл
			
			Если СтрСравнить(Элемент.Ключ, "ЭтоГруппа") = 0 И НЕ ДоступныГруппы Тогда
				Продолжить;
			КонецЕсли;
			
			ИмяПараметра = "Параметр_" + ЮТОбщий.ЧислоВСтроку(Запрос.Параметры.Количество() + 1);
			Условия = ЮТСтроки.ДобавитьСтроку(Условия, СтрШаблон("%1 = &%2", Элемент.Ключ, ИмяПараметра), " И ");
			Запрос.УстановитьПараметр(ИмяПараметра, Элемент.Значение);
			
		КонецЦикла;
		
		Если НЕ ПустаяСтрока(Условия) Тогда
			Условия = "ГДЕ " + Условия;
		КонецЕсли;
		
	КонецЕсли;
	
	Возврат Условия;
	
КонецФункции

Функция ВыбираемыеПоля(ОписаниеОбъектаМетаданных, РеквизитУпорядочивания)
	
	ВыбираемыеПоля = Новый Массив;
	Для Каждого Реквизит Из ОписаниеОбъектаМетаданных.Реквизиты Цикл
		
		Если Реквизит.Значение.ЭтоКлюч Тогда
			ВыбираемыеПоля.Добавить(Реквизит.Ключ);
		КонецЕсли;
		
	КонецЦикла;
	
	Если РеквизитУпорядочивания <> Неопределено Тогда
		ВыбираемыеПоля.Добавить(РеквизитУпорядочивания);
	КонецЕсли;
	
	Возврат ВыбираемыеПоля;
	
КонецФункции

#КонецОбласти

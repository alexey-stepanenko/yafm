//©///////////////////////////////////////////////////////////////////////////©//
//
//  Copyright 2025-2026 Alexey A. Stepanenko 
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
	Идентификаторы.Добавить(Тип("Цвет"));
	
	Возврат Идентификаторы;
КонецФункции

Функция ЗначениеСвойства(ПредставлениеЗначенияСвойства, ОписаниеМодификаций) Экспорт
	Результат = Новый Цвет;
	ИдентификаторЦвета = МФОбработкаСтрокСлужебный.Идентификатор(ПредставлениеЗначенияСвойства);
	
	ОписаниеСвойства = Неопределено;
	Если МФОбработчикЗначенияЦветПовтИсп.ЭтоИдентификаторАвто(ИдентификаторЦвета) Тогда
		Результат = МФОбработчикЗначенияЦветПовтИсп.ЦветАвто();
	ИначеЕсли ОписаниеМодификаций.Цвета.Свойство(ИдентификаторЦвета, ОписаниеСвойства) Тогда  // BSLLS:EmptyCodeBlock-off
		// Значение свойства уже установлено в условии ветки
		Результат = ОписаниеСвойства.ЗначениеЦвета;
	Иначе
		// BSLLS:NestedFunctionInParameters-off
		ТекстИсключения = СтрШаблон(
			НСтр("ru='Отсутствует определение цвета ""%1"" в макете модификации формы'"),
			ПредставлениеЗначенияСвойства
		);
		// BSLLS:NestedFunctionInParameters-on
		
		ВызватьИсключение ТекстИсключения;
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

#КонецОбласти

//©///////////////////////////////////////////////////////////////////////////©//
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

Процедура ПослеПоказаВопросаОбОткрытииФормыАктуализацииМакетов(РезультатВопроса, ДополнительныеПараметры) Экспорт
	Если РезультатВопроса <> КодВозвратаДиалога.Да Тогда
		Возврат;
	КонецЕсли;
	ПараметрыОткрытияФормы = Новый Структура;
	ПараметрыОткрытияФормы.Вставить("РазличающиесяМакетыОписанийМодификаций", ДополнительныеПараметры);
	
	ОткрытьФорму(
		"ОбщаяФорма.МФАктуализацияМакетов",
		ПараметрыОткрытияФормы,
		, , , , ,
		РежимОткрытияОкнаФормы.БлокироватьВесьИнтерфейс
	);
КонецПроцедуры

Процедура ЗаполнитьВетки(Приемник, Источник) Экспорт
	ВеткиИсточника = Источник.ПолучитьЭлементы();
	ВеткиПриемника = Приемник.ПолучитьЭлементы();
	Для Каждого ВеткаИсточника Из ВеткиИсточника Цикл
		ВеткаПриемника = ВеткиПриемника.Добавить();
		ЗаполнитьЗначенияСвойств(ВеткаПриемника, ВеткаИсточника);
		ЗаполнитьВетки(ВеткаПриемника, ВеткаИсточника);
	КонецЦикла;
КонецПроцедуры

#КонецОбласти

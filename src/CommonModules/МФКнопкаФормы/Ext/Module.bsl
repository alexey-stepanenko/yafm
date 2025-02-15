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

// BSLLS:LineLength-off

#Область СлужебныйПрограммныйИнтерфейс

Функция ТипЭлементаФормы() Экспорт
	Возврат Тип("КнопкаФормы");
КонецФункции

Функция Идентификаторы() Экспорт
	Результат = Новый Массив;
	Результат.Добавить("КНОПКАФОРМЫ");
	
	Возврат Результат;
КонецФункции

Функция ЗависимостиСвойств() Экспорт
	Результат = Новый Структура;
	
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "Независимый", Неопределено, Неопределено);
	
	Возврат Результат;
КонецФункции

Процедура ЗаполнитьРазделОсновные(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделОсновные();
	
	Зависимость = Зависимости.Независимый;
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Заголовок, Раздел, Зависимость, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Вид, Раздел, Зависимость, Тип("ВидКнопкиФормы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ИмяКоманды, Раздел, Зависимость, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Видимость, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Доступность, Раздел, Зависимость, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Отображение, Раздел, Зависимость, Тип("ОтображениеКнопки"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Картинка, Раздел, Зависимость, Тип("Картинка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.КнопкаПоУмолчанию, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПропускатьПриВводе, Раздел, Зависимость, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АктивизироватьПоУмолчанию, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Пометка, Раздел, Зависимость, Тип("Булево"));
	// Отображение в контекстном меню?
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВажностьПриОтображении, Раздел, Зависимость, Тип("ВажностьПриОтображении"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоложениеВКоманднойПанели, Раздел, Зависимость, Тип("ПоложениеКнопкиВКоманднойПанели"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.УникальностьКоманды, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоведениеПриНедоступностиОсновногоСервера, Раздел, Зависимость, Тип("ПоведениеПриНедоступностиОсновногоСервера"));
КонецПроцедуры

Процедура ЗаполнитьРазделДанные(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	// Раздел "Данные" для кнопки формы не заполняется
КонецПроцедуры

Процедура ЗаполнитьРазделИспользование(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделИспользование();

	Зависимость = Зависимости.Независимый;
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображениеПодсказки, Раздел, Зависимость, Тип("ОтображениеПодсказки"));
КонецПроцедуры

Процедура ЗаполнитьРазделОформление(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделОформление();
	
	Зависимость = Зависимости.Независимый;
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветФона, Раздел, Зависимость, Тип("Цвет"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветТекста, Раздел, Зависимость, Тип("Цвет"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветРамки, Раздел, Зависимость, Тип("Цвет"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Шрифт, Раздел, Зависимость, Тип("Шрифт"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Фигура, Раздел, Зависимость, Тип("ФигураКнопки"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображениеФигуры, Раздел, Зависимость, Тип("ОтображениеФигурыКнопки"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоложениеКартинки, Раздел, Зависимость, Тип("ПоложениеКартинкиКнопкиФормы"));
КонецПроцедуры

Процедура ЗаполнитьРазделРасположение(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделРасположение();
	
	Зависимость = Зависимости.Независимый;
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Ширина, Раздел, Зависимость, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Высота, Раздел, Зависимость, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоМаксимальнаяШирина, Раздел, Зависимость, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоМаксимальнаяВысота, Раздел, Зависимость, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВысотаЗаголовка, Раздел, Зависимость, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГоризонтальноеПоложениеВГруппе, Раздел, Зависимость, Тип("ГоризонтальноеПоложениеЭлемента"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВертикальноеПоложениеВГруппе, Раздел, Зависимость, Тип("ВертикальноеПоложениеЭлемента"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РастягиватьПоГоризонтали, Раздел, Зависимость, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РастягиватьПоВертикали, Раздел, Зависимость, МФПовтИсп.ТипБулевоНеопределено());
КонецПроцедуры

Процедура ЗаполнитьРазделСобытия(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделСобытия();
	
	// TODO: Заполнить (issue: #15)
КонецПроцедуры

Процедура ЗаполнитьОбязательныеСвойства(ОписанияСвойств) Экспорт
	// BSLLS:NestedFunctionInParameters-off
	МФЭлементыФормыСлужебный.ДобавитьОбязательноеСвойство(
		ОписанияСвойств, 
		МФЭлементыФормыСлужебный.ИмяСвойстваВид(), 
		ВидКнопкиФормы.ОбычнаяКнопка
	);
	// BSLLS:NestedFunctionInParameters-on
КонецПроцедуры

#КонецОбласти

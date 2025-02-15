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
	Возврат Тип("ТаблицаФормы");
КонецФункции

Функция Идентификаторы() Экспорт
	Результат = Новый Массив;
	Результат.Добавить("ТАБЛИЦАФОРМЫ");
	
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
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПутьКДанным, Раздел, Зависимость, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоложениеЗаголовка, Раздел, Зависимость, Тип("ПоложениеЗаголовкаЭлементаФормы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Видимость, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Доступность, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ТолькоПросмотр, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПропускатьПриВводе, Раздел, Зависимость, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АктивизироватьПоУмолчанию, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимВыбора, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.МножественныйВыбор, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВажностьПриОтображении, Раздел, Зависимость, Тип("ВажностьПриОтображении"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоведениеПриНедоступностиОсновногоСервера , Раздел, Зависимость, Тип("ПоведениеПриНедоступностиОсновногоСервера"));
КонецПроцедуры

Процедура ЗаполнитьРазделДанные(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	// Раздел "Данные" для таблицы формы не заполняется
КонецПроцедуры

Процедура ЗаполнитьРазделИспользование(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделИспользование();
	
	Зависимость = Зависимости.Независимый;
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоложениеКоманднойПанели, Раздел, Зависимость, Тип("ПоложениеКоманднойПанелиЭлементаФормы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ИзменятьСоставСтрок, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ИзменятьПорядокСтрок, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Отображение, Раздел, Зависимость, Тип("ОтображениеТаблицы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимВводаСтрок, Раздел, Зависимость, Тип("РежимВводаСтрокТаблицы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимВыделения, Раздел, Зависимость, Тип("РежимВыделенияТаблицы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимВыделенияСтроки, Раздел, Зависимость, Тип("РежимВыделенияСтрокиТаблицы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Шапка, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Подвал, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Вывод, Раздел, Зависимость, Тип("ИспользованиеВывода"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоВводНовойСтроки, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоВводНезаполненного, Раздел, Зависимость, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоОтметкаНезаполненного, Раздел, Зависимость, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоискПриВводе, Раздел, Зависимость, Тип("ПоискВТаблицеПриВводе"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.СочетаниеКлавиш, Раздел, Зависимость, Тип("СочетаниеКлавиш"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РазрешитьНачалоПеретаскивания, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РазрешитьПеретаскивание, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.СпособПеретаскиванияФайлов, Раздел, Зависимость, Тип("СпособПеретаскиванияФайлов"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Подсказка, Раздел, Зависимость, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображениеПодсказки, Раздел, Зависимость, Тип("ОтображениеПодсказки"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПутьКДаннымКартинкиСтроки, Раздел, Зависимость, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.КартинкаСтрок, Раздел, Зависимость, Тип("Картинка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГоризонтальнаяПолосаПрокрутки, Раздел, Зависимость, Тип("ИспользованиеПолосыПрокрутки"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВертикальнаяПолосаПрокрутки, Раздел, Зависимость, Тип("ИспользованиеПолосыПрокрутки"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.НачальноеОтображениеСписка, Раздел, Зависимость, Тип("НачальноеОтображениеСписка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.НачальноеОтображениеДерева, Раздел, Зависимость, Тип("НачальноеОтображениеДерева"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоложениеСтрокиПоиска, Раздел, Зависимость, Тип("ПоложениеСтрокиПоиска"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоложениеСостоянияПросмотра, Раздел, Зависимость, Тип("ПоложениеСостоянияПросмотра"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоложениеУправленияПоиском, Раздел, Зависимость, Тип("ПоложениеУправленияПоиском"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЗапросОбновления, Раздел, Зависимость, Тип("СпособЗапросаОбновления"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ИспользованиеТекущейСтроки, Раздел, Зависимость, Тип("ИспользованиеТекущейСтрокиТаблицы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоведениеПриСжатииПоГоризонтали, Раздел, Зависимость, Тип("ПоведениеТаблицыПриСжатииПоГоризонтали"));
КонецПроцедуры

Процедура ЗаполнитьРазделОформление(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделОформление();
	
	Зависимость = Зависимости.Независимый;
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГоризонтальныеЛинии, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВертикальныеЛинии, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЧередованиеЦветовСтрок, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветФона, Раздел, Зависимость, Тип("Цвет"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветТекста, Раздел, Зависимость, Тип("Цвет"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветРамки, Раздел, Зависимость, Тип("Цвет"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Шрифт, Раздел, Зависимость, Тип("Шрифт"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветТекстаЗаголовка, Раздел, Зависимость, Тип("Цвет"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ШрифтЗаголовка, Раздел, Зависимость, Тип("Шрифт"));
КонецПроцедуры

Процедура ЗаполнитьРазделРасположение(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделРасположение();
	
	Зависимость = Зависимости.Независимый;
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Ширина, Раздел, Зависимость, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоМаксимальнаяШирина, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВариантУправленияВысотой, Раздел, Зависимость, Тип("ВариантУправленияВысотойТаблицы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Высота, Раздел, Зависимость, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоМаксимальнаяВысота, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВысотаВСтрокахТаблицы, Раздел, Зависимость, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоМаксимальнаяВысотаВСтрокахТаблицы, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГоризонтальноеПоложениеВГруппе, Раздел, Зависимость, Тип("ГоризонтальноеПоложениеЭлемента"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВертикальноеПоложениеВГруппе, Раздел, Зависимость, Тип("ВертикальноеПоложениеЭлемента"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РастягиватьПоГоризонтали, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РастягиватьПоВертикали, Раздел, Зависимость, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВысотаШапки, Раздел, Зависимость, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВысотаПодвала, Раздел, Зависимость, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВысотаЗаголовка, Раздел, Зависимость, Тип("Число"));
КонецПроцедуры

Процедура ЗаполнитьРазделСобытия(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделСобытия();
	
	// TODO: Заполнить (issue: #17)
КонецПроцедуры

Процедура ЗаполнитьОбязательныеСвойства(ОписанияСвойств) Экспорт
	
КонецПроцедуры

#КонецОбласти

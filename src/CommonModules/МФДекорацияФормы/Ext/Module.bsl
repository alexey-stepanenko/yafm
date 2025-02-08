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
	Возврат Тип("ДекорацияФормы");
КонецФункции

Функция Идентификаторы() Экспорт
	Результат = Новый Массив;
	Результат.Добавить("ДЕКОРАЦИЯФОРМЫ");
	
	Возврат Результат;
КонецФункции

Функция ЗависимостиСвойств() Экспорт
	Результат = Новый Структура;
	
	ИмяСвойстваВид = МФЭлементыФормыСлужебный.ИмяСвойстваВид();
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "Независимый", Неопределено, Неопределено);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидНадпись", ИмяСвойстваВид, ВидДекорацииФормы.Надпись);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидКартинка", ИмяСвойстваВид, ВидДекорацииФормы.Картинка);
	
	Возврат Результат;
КонецФункции

Процедура ЗаполнитьРазделОсновные(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделОсновные();
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Заголовок, Раздел, Зависимости.Независимый, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Вид, Раздел, Зависимости.Независимый, Тип("ВидДекорацииФормы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Видимость, Раздел, Зависимости.Независимый, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Доступность, Раздел, Зависимости.Независимый, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПропускатьПриВводе, Раздел, Зависимости.Независимый, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВажностьПриОтображении, Раздел, Зависимости.Независимый, Тип("ВажностьПриОтображении"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоведениеПриНедоступностиОсновногоСервера, Раздел, Зависимости.Независимый, Тип("ПоведениеПриНедоступностиОсновногоСервера"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Картинка, Раздел, Зависимости.ВидКартинка, Тип("Картинка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Гиперссылка, Раздел, Зависимости.Независимый, Тип("Булево"));
КонецПроцедуры

Процедура ЗаполнитьРазделДанные(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	// Раздел "Данные" для декорации формы не заполняется
КонецПроцедуры

Процедура ЗаполнитьРазделИспользование(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделИспользование();
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.СочетаниеКлавиш, Раздел, Зависимости.Независимый, Тип("СочетаниеКлавиш"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Подсказка, Раздел, Зависимости.Независимый, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображениеПодсказки, Раздел, Зависимости.Независимый, Тип("ОтображениеПодсказки"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Масштабировать, Раздел, Зависимости.ВидКартинка, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ТекстНевыбраннойКартинки, Раздел, Зависимости.ВидКартинка, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РазрешитьНачалоПеретаскивания, Раздел, Зависимости.ВидКартинка, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РазрешитьПеретаскивание, Раздел, Зависимости.ВидКартинка, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.СпособПеретаскиванияФайлов, Раздел, Зависимости.ВидКартинка, Тип("СпособПеретаскиванияФайлов"));
КонецПроцедуры

Процедура ЗаполнитьРазделОформление(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделОформление();
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветТекста, Раздел, Зависимости.Независимый, Тип("Цвет"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Шрифт, Раздел, Зависимости.Независимый, Тип("Шрифт"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветФона, Раздел, Зависимости.ВидНадпись, Тип("Цвет"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РазмерКартинки, Раздел, Зависимости.ВидКартинка, Тип("РазмерКартинки"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветРамки, Раздел, Зависимости.Независимый, Тип("Цвет"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Рамка, Раздел, Зависимости.Независимый, Тип("Рамка"));
КонецПроцедуры

Процедура ЗаполнитьРазделРасположение(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделРасположение();
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Ширина, Раздел, Зависимости.Независимый, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Высота, Раздел, Зависимости.Независимый, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоМаксимальнаяШирина, Раздел, Зависимости.Независимый, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоМаксимальнаяВысота, Раздел, Зависимости.Независимый, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГоризонтальноеПоложениеВГруппе, Раздел, Зависимости.Независимый, Тип("ГоризонтальноеПоложениеЭлемента"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВертикальноеПоложениеВГруппе, Раздел, Зависимости.Независимый, Тип("ВертикальноеПоложениеЭлемента"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГоризонтальноеПоложение, Раздел, Зависимости.ВидНадпись, Тип("ГоризонтальноеПоложениеЭлемента"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВертикальноеПоложение, Раздел, Зависимости.ВидНадпись, Тип("ВертикальноеПоложениеЭлемента"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РастягиватьПоГоризонтали, Раздел, Зависимости.Независимый, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РастягиватьПоВертикали, Раздел, Зависимости.Независимый, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВысотаЗаголовка, Раздел, Зависимости.ВидНадпись, Тип("Число"));
КонецПроцедуры

Процедура ЗаполнитьРазделСобытия(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделСобытия();
	
	// TODO: Заполнить (issue: #14)
КонецПроцедуры

Процедура ЗаполнитьОбязательныеСвойства(ОписанияСвойств) Экспорт
	// BSLLS:NestedFunctionInParameters-off
	МФЭлементыФормыСлужебный.ДобавитьОбязательноеСвойство(
		ОписанияСвойств, 
		МФЭлементыФормыСлужебный.ИмяСвойстваВид(), 
		ВидДекорацииФормы.Надпись
	);
	// BSLLS:NestedFunctionInParameters-on
КонецПроцедуры

#КонецОбласти

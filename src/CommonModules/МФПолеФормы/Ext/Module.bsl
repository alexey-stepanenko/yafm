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
	Возврат Тип("ПолеФормы");
КонецФункции

Функция Идентификаторы() Экспорт
	Результат = Новый Массив;
	Результат.Добавить("ПОЛЕФОРМЫ");
	
	Возврат Результат;
КонецФункции

Функция ЗависимостиСвойств() Экспорт
	Результат = Новый Структура;
	
	ИмяСвойстваВид = МФЭлементыФормыСлужебный.ИмяСвойстваВид();
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "Независимый", Неопределено, Неопределено);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеHTMLДокумента", ИмяСвойстваВид, ВидПоляФормы.ПолеHTMLДокумента);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеPDFДокумента", ИмяСвойстваВид, ВидПоляФормы.ПолеPDFДокумента);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеВвода", ИмяСвойстваВид, ВидПоляФормы.ПолеВвода);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеГеографическойСхемы", ИмяСвойстваВид, ВидПоляФормы.ПолеГеографическойСхемы);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеГрафическойСхемы", ИмяСвойстваВид, ВидПоляФормы.ПолеГрафическойСхемы);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеДендрограммы", ИмяСвойстваВид, ВидПоляФормы.ПолеДендрограммы);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеДиаграммы", ИмяСвойстваВид, ВидПоляФормы.ПолеДиаграммы);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеДиаграммыГанта", ИмяСвойстваВид, ВидПоляФормы.ПолеДиаграммыГанта);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеИндикатора", ИмяСвойстваВид, ВидПоляФормы.ПолеИндикатора);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеКалендаря", ИмяСвойстваВид, ВидПоляФормы.ПолеКалендаря);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеКартинки", ИмяСвойстваВид, ВидПоляФормы.ПолеКартинки);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеНадписи", ИмяСвойстваВид, ВидПоляФормы.ПолеНадписи);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеПереключателя", ИмяСвойстваВид, ВидПоляФормы.ПолеПереключателя);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеПериода", ИмяСвойстваВид, ВидПоляФормы.ПолеПериода);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеПланировщика", ИмяСвойстваВид, ВидПоляФормы.ПолеПланировщика);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеПолосыРегулирования", ИмяСвойстваВид, ВидПоляФормы.ПолеПолосыРегулирования);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеТабличногоДокумента", ИмяСвойстваВид, ВидПоляФормы.ПолеТабличногоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеТекстовогоДокумента", ИмяСвойстваВид, ВидПоляФормы.ПолеТекстовогоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеФлажка", ИмяСвойстваВид, ВидПоляФормы.ПолеФлажка);
	МФЭлементыФормыСлужебный.ДобавитьЗависимость(Результат, "ВидПолеФорматированногоДокумента", ИмяСвойстваВид, ВидПоляФормы.ПолеФорматированногоДокумента);
	
	Возврат Результат;
КонецФункции

Процедура ЗаполнитьРазделОсновные(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделОсновные();
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Заголовок, Раздел, Зависимости.Независимый, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Вид, Раздел, Зависимости.Независимый, Тип("ВидПоляФормы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПутьКДанным, Раздел, Зависимости.Независимый, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоложениеЗаголовка, Раздел, Зависимости.Независимый, Тип("ПоложениеЗаголовкаЭлементаФормы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Видимость, Раздел, Зависимости.Независимый, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Доступность, Раздел, Зависимости.Независимый, Тип("Булево"));
	
	ЗависимостьТолькоПросмотр = Новый Массив;
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеPDFДокумента);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеВвода);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеГеографическойСхемы);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеГрафическойСхемы);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеДендрограммы);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеДиаграммы);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеДиаграммыГанта);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеИндикатора);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеКалендаря);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеКартинки);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеНадписи);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеПереключателя);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеПериода);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеПланировщика);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеПолосыРегулирования);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеТабличногоДокумента);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеТекстовогоДокумента);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеФлажка);
	ЗависимостьТолькоПросмотр.Добавить(Зависимости.ВидПолеФорматированногоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ТолькоПросмотр, Раздел, ЗависимостьТолькоПросмотр, Тип("Булево"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПропускатьПриВводе, Раздел, Зависимости.Независимый, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АктивизироватьПоУмолчанию, Раздел, Зависимости.Независимый, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВажностьПриОтображении, Раздел, Зависимости.Независимый, Тип("ВажностьПриОтображении"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоведениеПриНедоступностиОсновногоСервера, Раздел, Зависимости.Независимый, Тип("ПоведениеПриНедоступностиОсновногоСервера"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Маска, Раздел, Зависимости.ВидПолеВвода, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимПароля, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.МногострочныйРежим, Раздел, Зависимости.ВидПолеВвода, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РасширенноеРедактирование, Раздел, Зависимости.ВидПолеВвода, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ФорматРедактирования, Раздел, Зависимости.ВидПолеВвода, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.КартинкаЗначений, Раздел, Зависимости.ВидПолеКартинки, Тип("Картинка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Формат, Раздел, Зависимости.ВидПолеНадписи, Тип("Булево"));
	
	ЗависимостьГиперссылка = Новый Массив;
	ЗависимостьГиперссылка.Добавить(Зависимости.ВидПолеКартинки);
	ЗависимостьГиперссылка.Добавить(Зависимости.ВидПолеНадписи);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Гиперссылка, Раздел, ЗависимостьГиперссылка, Тип("Булево"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВидПереключателя, Раздел, Зависимости.ВидПолеПереключателя, Тип("ВидПереключателя"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВидФлажка, Раздел, Зависимости.ВидПолеФлажка, Тип("ВидФлажка"));
КонецПроцедуры

Процедура ЗаполнитьРазделДанные(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделДанные();
	
	ЗависимостьЗначение = Новый Массив;
	ЗависимостьЗначение.Добавить(Зависимости.ВидПолеВвода);
	ЗависимостьЗначение.Добавить(Зависимости.ВидПолеИндикатора);
	ЗависимостьЗначение.Добавить(Зависимости.ВидПолеПолосыРегулирования);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.МинимальноеЗначение, Раздел, ЗависимостьЗначение, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.МаксимальноеЗначение, Раздел, ЗависимостьЗначение, Тип("Число"));
КонецПроцедуры

Процедура ЗаполнитьРазделИспользование(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделИспользование();
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображениеПредупрежденияПриРедактировании, Раздел, Зависимости.Независимый, Тип("ОтображениеПредупрежденияПриРедактировании"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПредупреждениеПриРедактировании, Раздел, Зависимости.Независимый, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.СочетаниеКлавиш, Раздел, Зависимости.Независимый, Тип("СочетаниеКлавиш"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Защита, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображатьСетку, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображатьЗаголовки, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЧерноБелыйПросмотр, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимОтображенияВыделения, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("РежимОтображенияВыделения"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимОтображенияВыделенияРисунков, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("РежимОтображенияВыделенияРисунков"));
	
	ЗависимостьВывод = Новый Массив;
	ЗависимостьВывод.Добавить(Зависимости.ВидПолеHTMLДокумента);
	ЗависимостьВывод.Добавить(Зависимости.ВидПолеPDFДокумента);
	ЗависимостьВывод.Добавить(Зависимости.ВидПолеТабличногоДокумента);
	ЗависимостьВывод.Добавить(Зависимости.ВидПолеТекстовогоДокумента);
	ЗависимостьВывод.Добавить(Зависимости.ВидПолеФорматированногоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Вывод, Раздел, ЗависимостьВывод, Тип("ИспользованиеВывода"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.КнопкаВыпадающегоСписка, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.КнопкаВыбора, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.КнопкаОчистки, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.КнопкаРегулирования, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.КнопкаОткрытия, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.КнопкаСоздания, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображениеКнопкиВыбора, Раздел, Зависимости.ВидПолеВвода, Тип("ОтображениеКнопкиВыбора"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимВыбораИзСписка, Раздел, Зависимости.ВидПолеВвода, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВыбиратьТип, Раздел, Зависимости.ВидПолеВвода, Тип("Булево"));
	
	ЗависимостьСписокВыбора = Новый Массив;
	ЗависимостьСписокВыбора.Добавить(Зависимости.ВидПолеВвода);
	ЗависимостьСписокВыбора.Добавить(Зависимости.ВидПолеПереключателя);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.СписокВыбора, Раздел, Зависимости.ВидПолеВвода, Тип("СписокЗначений"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимВыбораНезаполненного, Раздел, Зависимости.ВидПолеВвода, Тип("РежимВыбораНезаполненного"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РедактированиеТекста, Раздел, Зависимости.ВидПолеВвода, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОбновлениеТекстаРедактирования, Раздел, Зависимости.ВидПолеВвода, Тип("ОбновлениеТекстаРедактирования"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоПереносСтрок, Раздел, Зависимости.ВидПолеВвода, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВыделятьОтрицательные, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоОтметкаНезаполненного, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоВыборНезаполненного, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВыборГруппИЭлементов, Раздел, Зависимости.ВидПолеВвода, Тип("ГруппыИЭлементы"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.СвязиПараметровВыбора, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипСвязиПараметровВыбора());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПараметрыВыбора, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипПараметрыВыбора());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.БыстрыйВыбор, Раздел, Зависимости.ВидПолеВвода, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ИсторияВыбораПриВводе, Раздел, Зависимости.ВидПолеВвода, Тип("ИсторияВыбораПриВводе"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ФормаВыбора, Раздел, Зависимости.ВидПолеВвода, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.СвязьПоТипу, Раздел, Зависимости.ВидПолеВвода, Тип("СвязьПоТипу"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоОтображениеКнопкиОчистки, Раздел, Зависимости.ВидПолеВвода, Тип("РежимАвтоОтображенияКнопкиОчистки"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоОтображениеКнопкиОткрытия, Раздел, Зависимости.ВидПолеВвода, Тип("РежимАвтоОтображенияКнопкиОткрытия"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоИсправлениеПриВводеТекста, Раздел, Зависимости.ВидПолеВвода, Тип("АвтоИсправлениеПриВводеТекста"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПроверкаПравописанияПриВводеТекста, Раздел, Зависимости.ВидПолеВвода, Тип("ПроверкаПравописанияПриВводеТекста"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоИзменениеРегистраПриВводеТекста, Раздел, Зависимости.ВидПолеВвода, Тип("АвтоИзменениеРегистраПриВводеТекста"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.СпециальныйРежимВводаТекста, Раздел, Зависимости.ВидПолеВвода, Тип("СпециальныйРежимВводаТекста"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПодсказкаАвтоЗаполнения, Раздел, Зависимости.ВидПолеВвода, Тип("ПодсказкаАвтоЗаполненияПоляВвода"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ТекстКнопкиВводаЭкраннойКлавиатуры, Раздел, Зависимости.ВидПолеВвода, Тип("ТекстКнопкиВводаЭкраннойКлавиатуры"));
	
	ЗависимостьРедактирование = Новый Массив;
	ЗависимостьРедактирование.Добавить(Зависимости.ВидПолеГрафическойСхемы);
	ЗависимостьРедактирование.Добавить(Зависимости.ВидПолеТабличногоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Редактирование, Раздел, ЗависимостьРедактирование, Тип("Булево"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимВыделенияЗначений, Раздел, Зависимости.ВидПолеДиаграммыГанта, Тип("РежимВыделенияЗначенийДиаграммыГанта"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимВыделенияИнтервалов, Раздел, Зависимости.ВидПолеДиаграммыГанта, Тип("РежимВыделенияЗначенийДиаграммыГанта"));
	
	ЗависимостьОриентация = Новый Массив;
	ЗависимостьОриентация.Добавить(Зависимости.ВидПолеИндикатора);
	ЗависимостьОриентация.Добавить(Зависимости.ВидПолеПолосыРегулирования);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Ориентация, Раздел, ЗависимостьОриентация, Тип("ОриентацияЭлементаФормы"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Отображение, Раздел, Зависимости.ВидПолеИндикатора, Тип("РежимСглаживанияИндикатора"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображатьПроценты, Раздел, Зависимости.ВидПолеИндикатора, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимВыделения, Раздел, Зависимости.ВидПолеКалендаря, Тип("РежимВыделенияДаты"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображатьТекущуюДату, Раздел, Зависимости.ВидПолеКалендаря, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображатьПанельМесяцев, Раздел, Зависимости.ВидПолеКалендаря, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПеремещениеПоКалендарю, Раздел, Зависимости.ВидПолеКалендаря, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.НачалоПериодаОтображения, Раздел, Зависимости.ВидПолеКалендаря, МФПовтИсп.ТипДатаНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.КонецПериодаОтображения, Раздел, Зависимости.ВидПолеКалендаря, МФПовтИсп.ТипДатаНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Масштабировать, Раздел, Зависимости.ВидПолеКартинки, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ТекстНевыбраннойКартинки, Раздел, Зависимости.ВидПолеКартинки, Тип("Строка"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображатьГруппировки, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("Булево"));
	
	ЗависимостьПеретаскивание = Новый Массив;
	ЗависимостьПеретаскивание.Добавить(Зависимости.ВидПолеКалендаря);
	ЗависимостьПеретаскивание.Добавить(Зависимости.ВидПолеКартинки);
	ЗависимостьПеретаскивание.Добавить(Зависимости.ВидПолеПланировщика);
	ЗависимостьПеретаскивание.Добавить(Зависимости.ВидПолеТабличногоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РазрешитьНачалоПеретаскивания, Раздел, ЗависимостьПеретаскивание, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РазрешитьПеретаскивание, Раздел, ЗависимостьПеретаскивание, Тип("Булево"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.СпособПеретаскиванияФайлов, Раздел, Зависимости.ВидПолеКартинки, Тип("СпособПеретаскиванияФайлов"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВыделятьОтрицательные, Раздел, Зависимости.ВидПолеНадписи, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображениеРазметки, Раздел, Зависимости.ВидПолеПолосыРегулирования, Тип("ОтображениеРазметкиПолосыРегулирования"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ШагРазметки, Раздел, Зависимости.ВидПолеПолосыРегулирования, Тип("Число"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РежимМасштабированияПросмотра, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("РежимМасштабированияПросмотра"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображатьИменаЯчеек, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображатьИменаСтрокИКолонок, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ТипКурсоров, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("ТипКурсоровТабличногоДокумента"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВертикальнаяПолосаПрокрутки, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("ИспользованиеПолосыПрокрутки"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГоризонтальнаяПолосаПрокрутки, Раздел, Зависимости.ВидПолеТабличногоДокумента, Тип("ИспользованиеПолосыПрокрутки"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Подсказка, Раздел, Зависимости.Независимый, Тип("СочетаниеКлавиш"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ОтображениеПодсказки, Раздел, Зависимости.Независимый, Тип("ОтображениеПодсказки"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоложениеСостоянияПросмотра, Раздел, Зависимости.ВидПолеPDFДокумента, Тип("ПоложениеСостоянияПросмотра"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПодсказкаВвода, Раздел, Зависимости.ВидПолеВвода, Тип("Строка"));
КонецПроцедуры

Процедура ЗаполнитьРазделОформление(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделОформление();
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветТекстаЗаголовка, Раздел, Зависимости.Независимый, Тип("Цвет"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ШрифтЗаголовка, Раздел, Зависимости.Независимый, Тип("Шрифт"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.КартинкаКнопкиВыбора, Раздел, Зависимости.ВидПолеВвода, Тип("Картинка"));
	
	ЗависимостьЦветФона = Новый Массив;
	ЗависимостьЦветФона.Добавить(Зависимости.ВидПолеВвода);
	ЗависимостьЦветФона.Добавить(Зависимости.ВидПолеНадписи);
	ЗависимостьЦветФона.Добавить(Зависимости.ВидПолеТекстовогоДокумента);
	ЗависимостьЦветФона.Добавить(Зависимости.ВидПолеФорматированногоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветФона, Раздел, ЗависимостьЦветФона, Тип("Цвет"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РазмерКартинки, Раздел, Зависимости.ВидПолеКартинки, Тип("РазмерКартинки"));
	
	ЗависимостьЦветТекста = Новый Массив;
	ЗависимостьЦветТекста.Добавить(Зависимости.ВидПолеВвода);
	ЗависимостьЦветТекста.Добавить(Зависимости.ВидПолеКартинки);
	ЗависимостьЦветТекста.Добавить(Зависимости.ВидПолеНадписи);
	ЗависимостьЦветТекста.Добавить(Зависимости.ВидПолеПереключателя);
	ЗависимостьЦветТекста.Добавить(Зависимости.ВидПолеТекстовогоДокумента);
	ЗависимостьЦветТекста.Добавить(Зависимости.ВидПолеФорматированногоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветТекста, Раздел, ЗависимостьЦветТекста, Тип("Цвет"));
	
	ЗависимостьЦветРамки = Новый Массив;
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеHTMLДокумента);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеPDFДокумента);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеВвода);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеГеографическойСхемы);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеГрафическойСхемы);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеИндикатора);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеКалендаря);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеКартинки);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеНадписи);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеПереключателя);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеПериода);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеТабличногоДокумента);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеТекстовогоДокумента);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеФлажка);
	ЗависимостьЦветРамки.Добавить(Зависимости.ВидПолеФорматированногоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ЦветРамки, Раздел, ЗависимостьЦветРамки, Тип("Цвет"));
	
	ЗависимостьРамка = Новый Массив;
	ЗависимостьРамка.Добавить(Зависимости.ВидПолеКалендаря);
	ЗависимостьРамка.Добавить(Зависимости.ВидПолеКартинки);
	ЗависимостьРамка.Добавить(Зависимости.ВидПолеНадписи);
	ЗависимостьРамка.Добавить(Зависимости.ВидПолеПериода);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Рамка, Раздел, ЗависимостьРамка, Тип("Рамка"));
	
	ЗависимостьШрифт = Новый Массив;
	ЗависимостьШрифт.Добавить(Зависимости.ВидПолеВвода);
	ЗависимостьШрифт.Добавить(Зависимости.ВидПолеКалендаря);
	ЗависимостьШрифт.Добавить(Зависимости.ВидПолеКартинки);
	ЗависимостьШрифт.Добавить(Зависимости.ВидПолеНадписи);
	ЗависимостьШрифт.Добавить(Зависимости.ВидПолеПереключателя);
	ЗависимостьШрифт.Добавить(Зависимости.ВидПолеПериода);
	ЗависимостьШрифт.Добавить(Зависимости.ВидПолеТекстовогоДокумента);
	ЗависимостьШрифт.Добавить(Зависимости.ВидПолеФорматированногоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Шрифт, Раздел, ЗависимостьШрифт, Тип("Шрифт"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГоризонтальныеЛинии, Раздел, Зависимости.ВидПолеДиаграммыГанта, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВертикальныеЛинии, Раздел, Зависимости.ВидПолеДиаграммыГанта, МФПовтИсп.ТипБулевоНеопределено());
КонецПроцедуры

Процедура ЗаполнитьРазделРасположение(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделРасположение();
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГоризонтальноеПоложениеВГруппе, Раздел, Зависимости.Независимый, Тип("ГоризонтальноеПоложениеЭлемента"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВертикальноеПоложениеВГруппе, Раздел, Зависимости.Независимый, Тип("ВертикальноеПоложениеЭлемента"));
	
	ЗависимостьГоризонтальноеПоложение = Новый Массив;
	ЗависимостьГоризонтальноеПоложение.Добавить(Зависимости.ВидПолеВвода);
	ЗависимостьГоризонтальноеПоложение.Добавить(Зависимости.ВидПолеНадписи);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГоризонтальноеПоложение, Раздел, ЗависимостьГоризонтальноеПоложение, Тип("ГоризонтальноеПоложениеЭлемента"));
	
	ЗависимостьВертикальноеПоложение = Новый Массив;
	ЗависимостьВертикальноеПоложение.Добавить(Зависимости.ВидПолеНадписи);
	ЗависимостьВертикальноеПоложение.Добавить(Зависимости.ВидПолеПереключателя);
	ЗависимостьВертикальноеПоложение.Добавить(Зависимости.ВидПолеФлажка);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВертикальноеПоложение, Раздел, ЗависимостьВертикальноеПоложение, Тип("ВертикальноеПоложениеЭлемента"));
	
	ЗависимостьШиринаВысота = Новый Массив;
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеHTMLДокумента);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеPDFДокумента);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеВвода);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеГеографическойСхемы);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеГрафическойСхемы);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеДендрограммы);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеДиаграммы);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеДиаграммыГанта);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеИндикатора);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеКалендаря);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеКартинки);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеНадписи);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеПланировщика);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеПолосыРегулирования);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеТабличногоДокумента);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеТекстовогоДокумента);
	ЗависимостьШиринаВысота.Добавить(Зависимости.ВидПолеФорматированногоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Ширина, Раздел, ЗависимостьШиринаВысота, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.Высота, Раздел, ЗависимостьШиринаВысота, Тип("Число"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ШиринаВМесяцах, Раздел, Зависимости.ВидПолеКалендаря, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВысотаВМесяцах, Раздел, Зависимости.ВидПолеКалендаря, Тип("Число"));
	
	ЗависимостьАвтоМаксимальнаяШиринаВысота = Новый Массив;
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеHTMLДокумента);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеPDFДокумента);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеВвода);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеГеографическойСхемы);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеГрафическойСхемы);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеДендрограммы);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеДиаграммы);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеДиаграммыГанта);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеИндикатора);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеКалендаря);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеКартинки);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеНадписи);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеПериода);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеПланировщика);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеПолосыРегулирования);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеТабличногоДокумента);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеТекстовогоДокумента);
	ЗависимостьАвтоМаксимальнаяШиринаВысота.Добавить(Зависимости.ВидПолеФорматированногоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоМаксимальнаяШирина, Раздел, ЗависимостьАвтоМаксимальнаяШиринаВысота, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.АвтоМаксимальнаяВысота, Раздел, ЗависимостьАвтоМаксимальнаяШиринаВысота, Тип("Число"));
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВариантУправленияВысотой, Раздел, Зависимости.ВидПолеВвода, Тип("ВариантУправленияВысотойЭлемента"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВысотаСпискаВыбора, Раздел, Зависимости.ВидПолеВвода, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ШиринаВыпадающегоСписка, Раздел, Зависимости.ВидПолеВвода, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГиперссылкаЭлементаШкалыВремени, Раздел, Зависимости.ВидПолеПланировщика, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГиперссылкаЭлементаИзмерения, Раздел, Зависимости.ВидПолеПланировщика, Тип("Булево"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ГиперссылкаПеренесенногоЗаголовкаШкалыВремени, Раздел, Зависимости.ВидПолеПланировщика, Тип("Булево"));
	
	ЗависимостьРастягивать = Новый Массив;
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеHTMLДокумента);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеPDFДокумента);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеВвода);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеГеографическойСхемы);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеГрафическойСхемы);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеДендрограммы);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеДиаграммы);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеДиаграммыГанта);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеИндикатора);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеКалендаря);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеКартинки);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеНадписи);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеПериода);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеПланировщика);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеПолосыРегулирования);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеТабличногоДокумента);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеТекстовогоДокумента);
	ЗависимостьРастягивать.Добавить(Зависимости.ВидПолеФорматированногоДокумента);
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РастягиватьПоГоризонтали, Раздел, ЗависимостьРастягивать, МФПовтИсп.ТипБулевоНеопределено());
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.РастягиватьПоВертикали, Раздел, ЗависимостьРастягивать, МФПовтИсп.ТипБулевоНеопределено());
	
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ПоложениеТаблицы, Раздел, Зависимости.ВидПолеДиаграммыГанта, Тип("ПоложениеТаблицыДиаграммыГанта"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.КоличествоКолонок, Раздел, Зависимости.ВидПолеПереключателя, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВысотаЗаголовка, Раздел, Зависимости.Независимый, Тип("Число"));
	МФЭлементыФормыСлужебный.ДобавитьОписаниеСвойстваЭлементаФормы(ОписанияСвойств, СинонимыСвойств.ВысотаЗаголовкаЭлемента, Раздел, Зависимости.ВидПолеПереключателя, Тип("Число"));
КонецПроцедуры

Процедура ЗаполнитьРазделСобытия(ОписанияСвойств, СинонимыСвойств, Зависимости) Экспорт
	Раздел = МФПовтИсп.РазделСобытия();
	
	// TODO: Заполнить (issue: #16)
КонецПроцедуры

Процедура ЗаполнитьОбязательныеСвойства(ОписанияСвойств) Экспорт
	// BSLLS:NestedFunctionInParameters-off
	МФЭлементыФормыСлужебный.ДобавитьОбязательноеСвойство(
		ОписанияСвойств, 
		МФЭлементыФормыСлужебный.ИмяСвойстваВид(), 
		ВидПоляФормы.ПолеВвода
	);
	// BSLLS:NestedFunctionInParameters-on
КонецПроцедуры

#КонецОбласти

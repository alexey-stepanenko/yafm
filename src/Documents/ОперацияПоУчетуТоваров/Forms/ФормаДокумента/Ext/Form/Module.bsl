﻿//////////////////////////////////////////////////////////////////////////////// 
// ОБРАБОТЧИКИ СОБЫТИЙ
// 

&НаКлиенте
Процедура ОрганизацияПриИзменении(Элемент)
	
	ПараметрыОпций = Новый Структура("Организация", Объект.Организация);
	УстановитьПараметрыФункциональныхОпцийФормы(ПараметрыОпций);
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Ключ.Пустая() Тогда 
		
		ПараметрыОпций = Новый Структура("Организация", Объект.Организация);
		УстановитьПараметрыФункциональныхОпцийФормы(ПараметрыОпций);
		
	КонецЕсли;
	
	МодификацияФорм.МодифицироватьФорму(
		ЭтаФорма,
		Отказ,
		"Обработки.ОписанияМодификацийФорм.Документ_ОперацияПоУчетуТоваров_ФормаДокумента"
	);
КонецПроцедуры


&НаСервере
Процедура ПриЗаписиНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	ПараметрыОпций = Новый Структура("Организация", Объект.Организация);
	УстановитьПараметрыФункциональныхОпцийФормы(ПараметрыОпций);
	
КонецПроцедуры


&НаСервере
Процедура ПослеЗаписиНаСервере(ТекущийОбъект, ПараметрыЗаписи)
	
	ПараметрыОпций = Новый Структура("Организация", Объект.Организация);
	УстановитьПараметрыФункциональныхОпцийФормы(ПараметрыОпций);
	
КонецПроцедуры

&НаСервере
Процедура ОбработкаПроверкиЗаполненияНаСервере(Отказ, ПроверяемыеРеквизиты)
	
	ТоварныеЗапасы = РеквизитФормыВЗначение("Объект.Движения.ТоварныеЗапасы");
	
	Если ТоварныеЗапасы.Количество() = 0 Тогда
		
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = НСтр("ru = 'Не заполнены данные о движениях!'", "ru");
		Сообщение.Сообщить();
		Отказ = Истина;
		
	КонецЕсли;
	
	Если Не ТоварныеЗапасы.ПроверитьЗаполнение() Тогда
		
		Отказ = Истина;
		
	КонецЕсли;
	
КонецПроцедуры


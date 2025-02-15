﻿//////////////////////////////////////////////////////////////////////////////// 
// ОБРАБОТЧИКИ СОБЫТИЙ 
// 

// Обработчик копирования документа выполняет также копирование движений
Процедура ПриКопировании(ОбъектКопирования)
	ОбъектКопирования.Движения.ТоварныеЗапасы.Прочитать();
    Для каждого ИсхЗапись Из ОбъектКопирования.Движения.ТоварныеЗапасы Цикл
		Запись = Движения.ТоварныеЗапасы.Добавить();
		Запись.ВидДвижения = ИсхЗапись.ВидДвижения;
		Запись.Товар = ИсхЗапись.Товар;
		Запись.Склад = ИсхЗапись.Склад;
		Запись.Количество = ИсхЗапись.Количество;
	КонецЦикла;
КонецПроцедуры

// Обработчик события, предшествующего записи, устанавливает всем
// движениям дату самого документа
Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	Для каждого Запись Из Движения.ТоварныеЗапасы Цикл
		Запись.Период = Дата;
	КонецЦикла;	
	
КонецПроцедуры	
	
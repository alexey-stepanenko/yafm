﻿
&НаСервере
Процедура ИспользоватьТекущееМестоположениеСервер(ДанныеАдреса, ДанныеМестоположения)
	
	Объект.Регион = Справочники.Регионы.НайтиПоНаименованию(ДанныеАдреса.Регион);
	Объект.Страна = ДанныеАдреса.Страна;
	Объект.Город = ДанныеАдреса.Город;
	Объект.Улица = ДанныеАдреса.Улица;
	Объект.Дом = ДанныеАдреса.Дом;
	Объект.Индекс = ДанныеАдреса.Индекс;
	Если ДанныеМестоположения <> Неопределено Тогда
		Объект.Широта = ДанныеМестоположения.Координаты.Широта;
		Объект.Долгота = ДанныеМестоположения.Координаты.Долгота;
	КонецЕсли;
    
КонецПроцедуры

&НаСервере
Функция СоздатьНовыйФайлСервер(Данные, Расширение, Тип)
	
	ТипСодержимого = Тип;
	Номер = Найти(ТипСодержимого, "/");
	Если Номер > 0 Тогда
		ТипСодержимого = Лев(ТипСодержимого, Номер - 1);
	КонецЕсли;
	Файл = Новый Файл(СтрЗаменить(Строка(ТекущаяДата()), ":", "_") + "." + Расширение);
	
	ХранимыйФайл = Справочники.ХранимыеФайлы.СоздатьЭлемент();
	ХранимыйФайл.Владелец = Объект.Ссылка;
	ХранимыйФайл.Наименование = ТипСодержимого + " " + Строка(ТекущаяДата());
	ХранимыйФайл.ИмяФайла = Файл.Имя;
	ХранимыйФайл.ДанныеФайла = Новый ХранилищеЗначения(Данные, Новый СжатиеДанных());
	ХранимыйФайл.Подпись = Новый ХранилищеЗначения(Неопределено, Новый СжатиеДанных());
	ХранимыйФайл.Зашифрован = Ложь;
	ХранимыйФайл.Подписан = Ложь;
	ХранимыйФайл.Записать();
	
	Возврат ХранимыйФайл.Наименование;
	
КонецФункции

&НаСервере
Процедура ЗаполнитьИзКонтактаНаСервере(ДанныеКонтакта)
	
#Если МобильныйАвтономныйСервер Тогда
	Объект.Наименование = ДанныеКонтакта.Фамилия + " " + ДанныеКонтакта.Имя + " " + ДанныеКонтакта.Отчество;
	Если ДанныеКонтакта.Адреса.Количество() > 0 Тогда
		ИспользоватьТекущееМестоположениеСервер(ДанныеКонтакта.Адреса[0].Значение, Неопределено)
	КонецЕсли;
	Для каждого Номер из ДанныеКонтакта.НомераТелефонов Цикл
		Если Номер.ТипДанных = ТипНомераТелефонаДанныхКонтакта.ДомашнийФакс
			ИЛИ Номер.ТипДанных = ТипНомераТелефонаДанныхКонтакта.РабочийФакс
			Или Номер.ТипДанных = ТипНомераТелефонаДанныхКонтакта.ДругойФакс Тогда
			Объект.Факс = Номер.Значение;
		Иначе
			Объект.Телефон = Номер.Значение;
		КонецЕсли;
	КонецЦикла;
	Если ДанныеКонтакта.АдресаЭлектроннойПочты.Количество() > 0 Тогда
		Объект.ЭлектроннаяПочта = ДанныеКонтакта.АдресаЭлектроннойПочты[0].Значение;
	КонецЕсли;
	Если ДанныеКонтакта.ВебАдреса.Количество() > 0 Тогда
		Объект.ВебСайт = ДанныеКонтакта.ВебАдреса[0].Значение;
	КонецЕсли;
	Объект.ДополнительнаяИнформация = ДанныеКонтакта.Заметка;
#КонецЕсли
	
КонецПроцедуры

&НаСервере
Процедура ПолучитьДанныеОтметки(ОтметкаДаты, ТекстОтметки)
	ОтметкаДаты = Константы.ОтметкаНаФотоснимкеДата.Получить();
	ТекстОтметки = Константы.ОтметкаНаФотоснимкеТекст.Получить();
КонецПроцедуры

#Если МобильныйКлиент Тогда 
	
&НаКлиенте
Функция СоздатьНовыйФайл(ДанныеМультимедиа)
	
	Если ДанныеМультимедиа <> Неопределено Тогда
		Возврат СоздатьНовыйФайлСервер(ДанныеМультимедиа.ПолучитьДвоичныеДанные(),ДанныеМультимедиа.РасширениеФайла,ДанныеМультимедиа.ТипСодержимого);
	КонецЕсли;
	Возврат "";
	
КонецФункции

#КонецЕсли

&НаКлиенте
Функция ПолучитьКоординатыКонтрагента()
	
#Если МобильныйКлиент Тогда 
	Координаты = Неопределено;
	Если Объект.Широта <> 0 ИЛИ Объект.Долгота <> 0 Тогда
		Координаты = Новый ГеографическиеКоординаты(Объект.Широта, Объект.Долгота);
	Иначе
		СтруктураДанныхАдреса = Новый Структура();
		СтруктураДанныхАдреса.Вставить("Регион",Объект.Регион);
		СтруктураДанныхАдреса.Вставить("Страна",Объект.Страна);
		СтруктураДанныхАдреса.Вставить("Город",Объект.Город);
		СтруктураДанныхАдреса.Вставить("Улица",Объект.Улица);
		СтруктураДанныхАдреса.Вставить("Дом",Объект.Дом);
		СтруктураДанныхАдреса.Вставить("Индекс",Объект.Индекс);
		ДанныеАдреса = Новый ДанныеАдреса(СтруктураДанныхАдреса);	
		Координаты = ПолучитьМестоположениеПоАдресу(ДанныеАдреса);
	КонецЕсли;
	Возврат Координаты;
#КонецЕсли

КонецФункции

//////////////////////////////////////////////////////////////////////////////// 
// ОБРАБОТЧИКИ СОБЫТИЙ
//

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)

#Если НЕ МобильныйАвтономныйСервер Тогда
	ПолучитьИдентификаторПользователяСистемыВзаимодействия();
#КонецЕсли

	МодификацияФорм.МодифицироватьФорму(
		ЭтаФорма,
		Отказ,
		"Обработки.ОписанияМодификацийФорм.Справочник_Контрагенты_ФормаЭлемента"
	);
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)

#Если НЕ МобильныйКлиент Тогда
    // Команды имеют смысл только на мобильном клиенте
    Элементы.ФормаПозвонить.Видимость = Ложь;
    Элементы.ФормаОтправитьСМС.Видимость = Ложь;
	Элементы.ФормаПостроитьМаршрут.Видимость = Ложь;
	Элементы.ФормаПоказатьКарту.Видимость = Ложь;
	Элементы.ФормаИспользоватьТекущееМестоположение.Видимость = Ложь;
	Элементы.ФормаСделатьАудиозапись.Видимость = Ложь;
	Элементы.ФормаСделатьВидеозапись.Видимость = Ложь;
	Элементы.ФормаСделатьФотоснимок.Видимость = Ложь;
	Элементы.ФормаИзКонтактов.Видимость = Ложь;
	Элементы.ФормаПоказатьКарту.Доступность = Ложь;
	Элементы.ФормаСоздатьГолосовуюЗаметку.Доступность = Ложь;
#Иначе
    Элементы.ФормаПозвонить.Доступность = СредстваТелефонии.ПоддерживаетсяНаборНомера();
    Элементы.ФормаОтправитьСМС.Доступность = СредстваТелефонии.ПоддерживаетсяОтправкаSMS(Истина);
	Элементы.ФормаСделатьАудиозапись.Доступность = СредстваМультимедиа.ПоддерживаетсяАудиозапись();
	Элементы.ФормаСделатьВидеозапись.Доступность = СредстваМультимедиа.ПоддерживаетсяВидеозапись();
	Элементы.ФормаСделатьФотоснимок.Доступность = СредстваМультимедиа.ПоддерживаетсяФотоснимок();
	Элементы.ФормаПоказатьКарту.Доступность = ПоддерживаетсяОтображениеКарты();
	Элементы.ФормаСоздатьГолосовуюЗаметку.Доступность = СредстваМультимедиа.ПоддерживаетсяАудиозапись();

	Если Объект.Ссылка.Пустая() Тогда
		НачатьРедактированиеЭлемента();
    КонецЕсли;
#КонецЕсли

КонецПроцедуры

//////////////////////////////////////////////////////////////////////////////// 
// ПРОЦЕДУРЫ И ФУНКЦИИ 
//

#Если НЕ МобильныйАвтономныйСервер Тогда
	
&НаСервере
Процедура ПолучитьИдентификаторПользователяСистемыВзаимодействия()

	Если НЕ Объект.Ссылка.Пустая() И
		НЕ ПустаяСтрока(Объект.ЭлектроннаяПочта) И
		СистемаВзаимодействия.ИспользованиеДоступно() Тогда

		ОтборПользователей = Новый ОтборПользователейСистемыВзаимодействия;
		ОтборПользователей.Заблокирован = Ложь;
		ОтборПользователей.АдресЭлектроннойПочтыДляАутентификации = Объект.ЭлектроннаяПочта;
		ОтобранныеПользователи = СистемаВзаимодействия.ПолучитьПользователей(ОтборПользователей);

		Если ОтобранныеПользователи.Количество() = 1 Тогда
			ИдентификаторПользователяСистемыВзаимодействия = ОтобранныеПользователи[0].Идентификатор;
		КонецЕсли;

	КонецЕсли;

КонецПроцедуры

&НаСервере
Функция ПригласитьКонтрагентаВСистемуВзаимодействия()

	Если ИдентификаторПользователяСистемыВзаимодействия = Неопределено Тогда
		ПолучитьИдентификаторПользователяСистемыВзаимодействия();
	КонецЕсли;

	Если ИдентификаторПользователяСистемыВзаимодействия = Неопределено Тогда
		СоздатьИдентификаторПользователяСистемыВзаимодействия();
	КонецЕсли;

	УстановитьПривилегированныйРежим(Истина);
	Если НЕ ИдентификаторПользователяСистемыВзаимодействия = Неопределено Тогда
		Попытка
			СистемаВзаимодействия.ОтправитьНавигационнуюСсылкуВнешнегоДоступа(ИдентификаторПользователяСистемыВзаимодействия);
			Возврат Истина;
		Исключение
			Возврат Ложь;
		КонецПопытки;
	Иначе
		Возврат Ложь;
	КонецЕсли;

КонецФункции

&НаСервере
Процедура СоздатьИдентификаторПользователяСистемыВзаимодействия()

	УстановитьПривилегированныйРежим(Истина);

	Если НЕ Объект.Ссылка.Пустая() И
		НЕ ПустаяСтрока(Объект.Наименование) И
		НЕ ПустаяСтрока(Объект.ЭлектроннаяПочта) И
		СистемаВзаимодействия.ИспользованиеДоступно() Тогда

		ПользовательСистемыВзаимодействия = СистемаВзаимодействия.СоздатьПользователя();
		ПользовательСистемыВзаимодействия.ПолноеИмя = Объект.Наименование;
		ПользовательСистемыВзаимодействия.АдресЭлектроннойПочтыДляАутентификации = Объект.ЭлектроннаяПочта;
		ПользовательСистемыВзаимодействия.АдресЭлектроннойПочты = Объект.ЭлектроннаяПочта;
		ПользовательСистемыВзаимодействия.НомерТелефона = Объект.Телефон;
		ПользовательСистемыВзаимодействия.Внешний = Истина;
		ПользовательСистемыВзаимодействия.Записать();

		ИдентификаторПользователяСистемыВзаимодействия = ПользовательСистемыВзаимодействия.Идентификатор;

	КонецЕсли;

КонецПроцедуры

#КонецЕсли

&НаКлиенте
Процедура НовыйРасчетныйСчет(Команда)
	НовыйРасчетныйСчетЗаполнить();
КонецПроцедуры

&НаКлиенте
Асинх Процедура НовыйРасчетныйСчетЗаполнить()
	Если Объект.Ссылка.Пустая() Тогда
		Ждать ПредупреждениеАсинх(НСтр("ru = 'Данные не записаны'", "ru"));
		Возврат;
	КонецЕсли;
	// Подготовка параметров и открытие формы нового расчетного счета контрагента.
	ЗначенияЗаполнения = Новый Структура();
	ЗначенияЗаполнения.Вставить("НаименованиеЗаполнить", "Р/С " + Объект.Наименование);
	ЗначенияЗаполнения.Вставить("Владелец", Объект.Ссылка);
	СтруктураПараметров = Новый Структура("ЗначенияЗаполнения", ЗначенияЗаполнения);
	ОткрытьФорму("Справочник.РасчетныеСчетаКонтрагентов.ФормаОбъекта", СтруктураПараметров);
КонецПроцедуры

&НаКлиенте
Процедура Позвонить(Команда)
	
    Если ЗначениеЗаполнено(Объект.Телефон) Тогда
        
#Если МобильныйКлиент Тогда 
		СредстваТелефонии.НабратьНомер(Объект.Телефон, Ложь);
#КонецЕсли
        
    Иначе
        
		// Сообщим пользователю о том, что информация не консистентна
		Сообщение = Новый СообщениеПользователю();
		Сообщение.Текст = НСтр("ru = 'Телефон не указан!'", "ru");
		Сообщение.Поле  = "Объект.Телефон";
		Сообщение.Сообщить();
        
    КонецЕсли
    
КонецПроцедуры

&НаКлиенте
Процедура ОтправитьСМС(Команда)
    
    Если ЗначениеЗаполнено(Объект.Телефон) Тогда
		
#Если МобильныйКлиент Тогда 
		Сообщение = Новый SMSСообщение();
		Сообщение.Получатели.Добавить(Объект.Телефон);
		СредстваТелефонии.ПослатьSMS(Сообщение, Истина);
#КонецЕсли
        
    Иначе
        
		// Сообщим пользователю о том, что информация не консистентна
		Сообщение = Новый СообщениеПользователю();
		Сообщение.Текст = НСтр("ru = 'Телефон не указан!'", "ru");
		Сообщение.Поле  = "Объект.Телефон";
		Сообщение.Сообщить();
        
    КонецЕсли
    
КонецПроцедуры
	
&НаКлиенте
Процедура СделатьАудиозапись(Команда)
	ВыполнитьСозданиеАудиозаписьВидеозаписьФотоснимок("АудиоЗапись");
КонецПроцедуры

&НаКлиенте
Процедура СделатьВидеозапись(Команда)
	ВыполнитьСозданиеАудиозаписьВидеозаписьФотоснимок("ВидеоЗапись");
КонецПроцедуры

&НаКлиенте
Процедура СделатьФотоснимок(Команда)
	ВыполнитьСозданиеАудиозаписьВидеозаписьФотоснимок("ФотоСнимок");
КонецПроцедуры

&НаКлиенте
Асинх Процедура ВыполнитьСозданиеАудиозаписьВидеозаписьФотоснимок(ТипМультиМедиа)
	Если Объект.Ссылка.Пустая() Тогда
		Ждать ПредупреждениеАсинх(НСтр("ru = 'Данные не записаны'", "ru"));
		Возврат;
	КонецЕсли;
#Если МобильныйКлиент Тогда 
	Если ТипМультиМедиа = "АудиоЗапись" Тогда
		ДанныеМультимедиа = СредстваМультимедиа.СделатьАудиозапись();
	ИначеЕсли ТипМультиМедиа = "ВидеоЗапись" Тогда
		ДанныеМультимедиа = СредстваМультимедиа.СделатьВидеозапись();
	ИначеЕсли ТипМультиМедиа = "ФотоСнимок" Тогда
		ОтметкаДаты = Неопределено;
		ТекстОтметки = Неопределено;
		ПолучитьДанныеОтметки(ОтметкаДаты, ТекстОтметки);
		Отметка = Новый ОтметкаНаФотоснимке(ОтметкаДаты, "ДФ='dd.MM.yyyy ЧЧ:мм'", ТекстОтметки);
		ДанныеМультимедиа = СредстваМультимедиа.СделатьФотоснимок(,,,,,Отметка);
	КонецЕсли;
	СоздатьНовыйФайл(ДанныеМультимедиа);
#КонецЕсли
КонецПроцедуры

&НаКлиенте
Процедура НапомнитьОЗвонке(Команда)
	Если ЗначениеЗаполнено(Объект.Телефон) Тогда
#Если МобильныйКлиент Тогда 
		УведомитьОЗвонке();
#КонецЕсли
    Иначе
		// Сообщим пользователю о том, что информация не консистентна
		Сообщение = Новый СообщениеПользователю();
		Сообщение.Текст = НСтр("ru = 'Телефон не указан!'", "ru");
		Сообщение.Поле  = "Объект.Телефон";
		Сообщение.Сообщить();
	КонецЕсли
КонецПроцедуры

#Если МобильныйКлиент Тогда 

&НаКлиенте
Асинх Процедура УведомитьОЗвонке()
	ВыбраннаяДата = Ждать ВвестиДатуАсинх(ТекущаяДата(), НСтр("ru = 'Введите время напоминания.'", "ru"));
	Если Не ВыбраннаяДата = Неопределено Тогда
		Уведомление = Новый ДоставляемоеУведомление();
		Уведомление.Текст = НСтр("ru = 'Перезвоните '", "ru") +  Объект.Наименование;
		Уведомление.Данные = "TN:" + Объект.Телефон;
		Уведомление.ДатаПоявленияУниверсальноеВремя = УниверсальноеВремя(ВыбраннаяДата);
		ДоставляемыеУведомления.ДобавитьЛокальноеУведомление(Уведомление);
	КонецЕсли;
КонецПроцедуры

#КонецЕсли

&НаКлиенте
Процедура ПоказатьКарту(Команда)
	
#Если МобильныйКлиент Тогда 
	Координаты = ПолучитьКоординатыКонтрагента();
	Если Координаты <> Неопределено Тогда
		ПоказатьНаКарте(Координаты);
	Иначе
		// Сообщим пользователю о том, что информация не консистентна
		Сообщение = Новый СообщениеПользователю();
		Сообщение.Текст = НСтр("ru = 'Не заполнены поля, описывающие адрес контрагента.'", "ru");
		Сообщение.Поле  = "Объект.Регион";
		Сообщение.Сообщить();
	КонецЕсли;
#КонецЕсли

КонецПроцедуры

&НаКлиенте
Процедура ИспользоватьТекущееМестоположение(Команда)
	
#Если МобильныйКлиент Тогда 
	Имя = "";		
	Если ГеопозиционированиеКлиент.ОбновитьМестоположение(Имя) Тогда
		ДанныеМестоположения = СредстваГеопозиционирования.ПолучитьПоследнееМестоположение(Имя);
		ДанныеАдреса = ПолучитьАдресПоМестоположению(ДанныеМестоположения.Координаты);
		Если ДанныеАдреса <> Неопределено Тогда
			ИспользоватьТекущееМестоположениеСервер(ДанныеАдреса, ДанныеМестоположения);
		Иначе
			Сообщить(НСтр("ru = 'Не удалось установить адрес по местоположению.'", "ru"));
		КонецЕсли;
	КонецЕсли;
#КонецЕсли

КонецПроцедуры

&НаКлиенте
Процедура ПостроитьМаршрут(Команда)
	
#Если МобильныйКлиент Тогда 
	ДанныеМестоположения = Неопределено;
	Имя = "";		
	Если ГеопозиционированиеКлиент.ОбновитьМестоположение(Имя) Тогда
		ДанныеМестоположения = СредстваГеопозиционирования.ПолучитьПоследнееМестоположение(Имя);
	КонецЕсли;
	
	Если ДанныеМестоположения = Неопределено Тогда
		Сообщить(НСтр("ru = 'Не удалось установить текущее местоположению.'", "ru"));
		Возврат;
	КонецЕсли;
	
	КоординатыКонтрагента = ПолучитьКоординатыКонтрагента();
	Если КоординатыКонтрагента = Неопределено Тогда
		Сообщить(НСтр("ru = 'Не удалось установить расположение контрагента.'", "ru"));
		Возврат;
	КонецЕсли;
	
	Запуск = Новый ЗапускПриложенияМобильногоУстройства("android.intent.action.VIEW",
		"http://maps.google.com/maps?saddr="
			+ XMLСтрока(ДанныеМестоположения.Координаты.Широта) + "," + XMLСтрока(ДанныеМестоположения.Координаты.Долгота)
			+ "&daddr="
			+ XMLСтрока(КоординатыКонтрагента.Широта) + "," + XMLСтрока(КоординатыКонтрагента.Долгота));
	Запуск.Запустить(Ложь);
	
#КонецЕсли
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьИзКонтактов(Команда)
#Если МобильныйКлиент Тогда 
	Список = Новый СписокЗначений();
	МенеджерКонтактов = Новый МенеджерКонтактов();
	УчетнаяЗапись = МенеджерКонтактов.ПолучитьЛокальнуюУчетнуюЗаписьКонтактов();
	Массив = МенеджерКонтактов.ПолучитьУчетныеЗаписиКонтактов();
	
	Ключи = МенеджерКонтактов.НайтиКонтакты();
	Для каждого Ключ Из Ключи Цикл
		Контакт = МенеджерКонтактов.ПолучитьКонтакт(Ключ);
		Представление = Контакт.ДанныеКонтакта.Имя;
		Если Не ПустаяСтрока(Представление) И Не ПустаяСтрока(Контакт.ДанныеКонтакта.Отчество) Тогда
			Представление = Представление + " " + Контакт.ДанныеКонтакта.Отчество;
		КонецЕсли;
		Если Не ПустаяСтрока(Представление) И Не ПустаяСтрока(Контакт.ДанныеКонтакта.Фамилия) Тогда
			Представление = Представление + " " + Контакт.ДанныеКонтакта.Фамилия;
		КонецЕсли;
		Если Не ПустаяСтрока(Представление) И Не ПустаяСтрока(Контакт.ДанныеКонтакта.Прозвище) Тогда
			Представление = Контакт.ДанныеКонтакта.Прозвище + "( " + Представление  + " )";
		КонецЕсли;
		Список.Добавить(Ключ, Представление);
	КонецЦикла;
	ВыполнитьЗаполнениеИзКонтакта(Список);
#КонецЕсли
КонецПроцедуры

#Если МобильныйКлиент Тогда 

&НаКлиенте
Асинх Процедура ВыполнитьЗаполнениеИзКонтакта(Список)
	ВыбранныйЭлементСписка = Ждать ВыбратьИзСпискаАсинх(Список);
	Если НЕ ВыбранныйЭлементСписка = Неопределено Тогда
		МенеджерКонтактов = Новый МенеджерКонтактов();
		Контакт = МенеджерКонтактов.ПолучитьКонтакт(ВыбранныйЭлементСписка.Значение);
		ЗаполнитьИзКонтактаНаСервере(Контакт.ДанныеКонтакта);
	КонецЕсли;
КонецПроцедуры

#КонецЕсли

&НаКлиенте
Асинх Процедура СоздатьГолосовуюЗаметку(Команда)
	
	Если Объект.Ссылка.Пустая() Тогда
		Ждать ПредупреждениеАсинх(НСтр("ru = 'Данные не записаны'", "ru"));
		Возврат;
	КонецЕсли;

#Если МобильныйКлиент Тогда
	ОбработчикОстановки = Новый ОписаниеОповещения("ОбработчикОстановкиЗаписи", ЭтотОбъект);
	СредстваМультимедиа.ВключитьАудиозапись(ОбработчикОстановки, , РасположениеКнопкиОстановкиЗаписиМультимедиа.ЛевоВерх);
#КонецЕсли

КонецПроцедуры             

#Если МобильныйКлиент Тогда

&НаКлиенте
Процедура ОбработчикОстановкиЗаписи(Результат, ДополнительныеПараметры) Экспорт  
	
	Если Результат <> Неопределено Тогда
		Наименование = СоздатьНовыйФайл(Результат);
		ПоказатьОповещениеПользователя("Заметка записана в хранимый файл" + Символы.ПС + Наименование);
	КонецЕсли;

КонецПроцедуры

#КонецЕсли 

&НаКлиенте
Асинх Функция ПроверитьВозомжностьИПригласитьВОбсуждения()
	Если Не Ждать ПроверитьВозможностьПриглашенияКонтрагентаВСистемуВзаимодействия() Тогда
		Возврат Ложь;
	КонецЕсли;

	Кнопки = Новый СписокЗначений;
	Кнопки.Добавить(1, НСтр("ru = 'Отправить'", "ru"));
	Кнопки.Добавить(2, НСтр("ru = 'Отмена'", "ru"));
	Если ИдентификаторПользователяСистемыВзаимодействия = Неопределено Тогда
		ТекстВопроса = СтрШаблон(НСтр("ru = 'Отправить приглашение на адрес электронной почты ''%1''?'", "ru"), Объект.ЭлектроннаяПочта);
	Иначе
		ТекстВопроса = СтрШаблон(НСтр("ru = 'Пользователь с адресом электронной почты ''%1'' уже приглашен.
									  |
									  |Отправить приглашение повторно?'", "ru"), Объект.ЭлектроннаяПочта);
	КонецЕсли;

	Если Ждать ВопросАсинх(ТекстВопроса, Кнопки, , 1) = 1 Тогда
		Если ПригласитьКонтрагентаВСистемуВзаимодействия() Тогда
			ПоказатьОповещениеПользователя(,, СтрШаблон(НСтр("ru = 'Приглашение отправлено на адрес электронной почты ''%1'''", "ru"), Объект.ЭлектроннаяПочта), БиблиотекаКартинок.ДиалогИнформация);
			Возврат Истина;
		Иначе
			ПоказатьОповещениеПользователя(,, СтрШаблон(НСтр("ru = 'Не удалось отправить приглашение на адрес электронной почты ''%1'''", "ru"), Объект.ЭлектроннаяПочта), БиблиотекаКартинок.ДиалогСтоп);
		КонецЕсли;
	КонецЕсли;   
	
	Возврат Ложь;
КонецФункции


&НаКлиенте
Асинх Процедура ПригласитьВОбсуждения(Команда)
	
	ПроверитьВозомжностьИПригласитьВОбсуждения();

КонецПроцедуры

&НаКлиенте
Асинх Функция ПроверитьВозможностьПриглашенияКонтрагентаВСистемуВзаимодействия()

	Если НЕ СистемаВзаимодействия.ИнформационнаяБазаЗарегистрирована() Тогда
		СистемаВзаимодействияКлиент.ВыполнитьРегистрацию();
		Возврат Ложь;
	КонецЕсли;

	Если НЕ СистемаВзаимодействия.ИспользованиеДоступно() ИЛИ НЕ СистемаВзаимодействия.ПоддерживаетсяВнешнийДоступ() Тогда
		СистемаВзаимодействияКлиент.СообщитьОНевозможностиВнешнегоДоступа();
		Возврат Ложь;
	КонецЕсли;

	Если Объект.Ссылка.Пустая() Тогда
		Ждать ПредупреждениеАсинх(НСтр("ru = 'Данные еще не записаны. Просьба записать.'", "ru"));
		Возврат Ложь;
	КонецЕсли;
	
	Если ПустаяСтрока(Объект.Наименование) Тогда
		Ждать ПредупреждениеАсинх(НСтр("ru = 'Просьба заполнить наименование'", "ru"));
		ЭтаФорма.ТекущийЭлемент = Элементы.Наименование;
		Возврат Ложь;
	КонецЕсли;

	Если ПустаяСтрока(Объект.ЭлектроннаяПочта) Тогда
		Ждать ПредупреждениеАсинх(НСтр("ru = 'Просьба заполнить электронную почту'", "ru"));
		ЭтаФорма.ТекущийЭлемент = Элементы.ЭлектроннаяПочта;
		Возврат Ложь;
	КонецЕсли;
	
	Возврат Истина;

КонецФункции

&НаКлиенте
Асинх Процедура ОткрытьОбсуждение(Команда)

	Если Не Ждать ПроверитьДоступностьКонтрагентаВСистемеВзаимодействия() Тогда
		Возврат;
	КонецЕсли;

	ПерейтиПоНавигационнойСсылке(ПолучитьНавигационнуюСсылкуОбсуждения());

КонецПроцедуры

&НаСервере
Функция ПолучитьНавигационнуюСсылкуОбсуждения()

#Если Не (МобильноеПриложениеСервер Или МобильныйАвтономныйСервер Или ВнешнееСоединение) Тогда
	Обсуждение = СистемаВзаимодействия.СоздатьОбсуждение();
	Обсуждение.Групповое = Ложь;
	Обсуждение.Участники.Добавить(ИдентификаторПользователяСистемыВзаимодействия);
	Обсуждение.Участники.Добавить(СистемаВзаимодействия.ИдентификаторТекущегоПользователя());
	Обсуждение.Записать();
	
	Возврат ПолучитьНавигационнуюСсылку(Обсуждение);
#Иначе
	Возврат Неопределено;
#КонецЕсли

КонецФункции

&НаКлиенте
Асинх Процедура Видеозвонок(Команда)

	Если Не Ждать ПроверитьДоступностьКонтрагентаВСистемеВзаимодействия() Тогда
		Возврат;
	КонецЕсли;
	
	Если Не СистемаВзаимодействия.ПоддерживаютсяВидеоконференции() Тогда
		Ждать ПредупреждениеАсинх(НСтр("ru = 'Система взаимодействия не поддерживает видеоконференции.'", "ru"));
		Возврат;
	КонецЕсли;

	Участники = Новый КоллекцияИдентификаторовПользователейСистемыВзаимодействия();
	Участники.Добавить(СистемаВзаимодействия.ИдентификаторТекущегоПользователя());
	Участники.Добавить(ИдентификаторПользователяСистемыВзаимодействия);

	СистемаВзаимодействия.ВидеоконференцияАсинх(Участники);

КонецПроцедуры

&НаКлиенте
Асинх Функция ПроверитьДоступностьКонтрагентаВСистемеВзаимодействия()

	Если ИдентификаторПользователяСистемыВзаимодействия = Неопределено Тогда
		ТекстВопроса = НСтр("ru = 'Контрагент не приглашен в обсуждение.
										|Пригласить?'", "ru");		
		Кнопки = Новый СписокЗначений;
		Кнопки.Добавить(1, НСтр("ru = 'Пригласить'", "ru"));
		Кнопки.Добавить(2, НСтр("ru = 'Отмена'", "ru"));                                        
		
		Если Ждать ВопросАсинх(ТекстВопроса, Кнопки, , 1) = 1 Тогда
			 Ждать ПроверитьВозомжностьИПригласитьВОбсуждения();
			 Если ИдентификаторПользователяСистемыВзаимодействия = Неопределено Тогда
				 Возврат Ложь;
			 КонецЕсли;
			 Возврат Истина;
		КонецЕсли;
		Возврат Ложь;
	Иначе
		Возврат Истина;
	КонецЕсли;

КонецФункции

&НаКлиенте
Процедура ЭлектроннаяПочтаПриИзменении(Элемент)
	
	Объект.ЭлектроннаяПочта = СокрЛП(Объект.ЭлектроннаяПочта);
#Если МобильныйКлиент Тогда 
	ЭлектроннаяПочтаСодержитОшибку = НЕ РаботаСПочтойВызовСервера.ПроверитьЭлектронныйАдрес(Объект.ЭлектроннаяПочта);
#КонецЕсли 
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
#Если НЕ (МобильноеПриложениеСервер ИЛИ МобильныйАвтономныйСервер) Тогда
	
	Если НЕ ПустаяСтрока(Объект.ЭлектроннаяПочта) Тогда
		ЭлектроннаяПочтаСодержитОшибку = НЕ РаботаСПочтойВызовСервера.ЭлектронныйАдресКорректный(Объект.ЭлектроннаяПочта);
	КонецЕсли;

#КонецЕсли 
	
КонецПроцедуры

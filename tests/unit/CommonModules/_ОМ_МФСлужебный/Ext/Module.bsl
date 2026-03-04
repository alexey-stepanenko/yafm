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

Процедура ИсполняемыеСценарии() Экспорт 
	МФТестированиеКлиентСерверПовтИсп
		.ФреймворкТестирования()
		.ЮТТесты
		.ДобавитьТестовыйНабор("Тестирование общего модуля ""МФСлужебный""")
			.ДобавитьТест("Версия", "Функция ""Версия""")
	;
КонецПроцедуры

#Область СлужебныеПроцедурыИФункции

#Область Версия

Процедура Версия() Экспорт 
	// Дано
	ВерсияКонфигурации = Метаданные.Версия;
	ВерсияИзМодуля = МФСлужебный.Версия();
	
	// Когда
	
	// Тогда
	
	МФТестированиеКлиентСерверПовтИсп
		.ФреймворкТестирования()
		.ЮТест
		.ОжидаетЧто(ВерсияИзМодуля)
		.Равно(ВерсияКонфигурации)
	;
КонецПроцедуры

#КонецОбласти

#КонецОбласти

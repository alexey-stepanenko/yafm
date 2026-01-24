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

// TODO 2025-02-04: Добавить описание ко всем процедурам модуля (issue: #12)

Процедура ИнициализироватьДанныеПротокола(Протокол) Экспорт
	
КонецПроцедуры

// РЕЖИМ РАЗРАБОТКИ: &После("ИнициализироватьДополнительныеПараметры")
// РЕЖИМ РАЗРАБОТКИ: Процедура Разработка_ИнициализироватьДополнительныеПараметры(Протокол)
Процедура ИнициализироватьДополнительныеПараметры(Протокол) Экспорт
// РЕЖИМ РАЗРАБОТКИ: НАЧАЛО БЛОКА
	Протокол.ДополнительныеПараметры.ВывестиНаЭкран = Истина;
// РЕЖИМ РАЗРАБОТКИ: КОНЕЦ БЛОКА
// РЕЖИМ РАЗРАБОТКИ: КонецПроцедуры
КонецПроцедуры

Процедура УстановитьПрерватьМодификациюПриОшибке(Протокол) Экспорт
	
КонецПроцедуры

Процедура УстановитьПрерватьВыводФормыПриОшибкахМодификации(Протокол) Экспорт

КонецПроцедуры

Процедура СформироватьТекстПротокола(ТекстПротокола, Протокол, Форма) Экспорт
	
КонецПроцедуры

Процедура ДоработатьСтрокуПротокола(Протокол, СтрокаПротокола) Экспорт
	
КонецПроцедуры

Процедура ИзменитьИмяСобытия(ИмяСобытия) Экспорт
	
КонецПроцедуры

#КонецОбласти

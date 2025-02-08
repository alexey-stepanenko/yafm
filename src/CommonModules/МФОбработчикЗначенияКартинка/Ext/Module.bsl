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

Функция Идентификаторы() Экспорт
	Идентификаторы = Новый Массив;
	Идентификаторы.Добавить(Тип("Картинка"));
	
	Возврат Идентификаторы;
КонецФункции

Функция ЗначениеСвойства(ПредставлениеЗначенияСвойства, ОписаниеМодификаций) Экспорт
	// TODO: Реализовать обработку картинки (issue: #20)
	Результат = Неопределено;
	
	Возврат Результат;
КонецФункции

#КонецОбласти

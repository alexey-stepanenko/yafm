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

&ИзменениеИКонтроль("СинонимыСвойствЭлементов")
Функция Тест_СинонимыСвойствЭлементов() Экспорт
	Результат = Новый Структура;
	Макет = ПолучитьОбщийМакет("МФСинонимыСвойствЭлементов");

	РазделительПолей = ";";
	Для Индекс = 2 По Макет.КоличествоСтрок() Цикл
		СтрокаМакета = СокрЛП(Макет.ПолучитьСтроку(Индекс));
		Если
			ПустаяСтрока(СтрокаМакета)
			Или (Лев(СтрокаМакета, 1) = "#")
		Тогда
			Продолжить;
		КонецЕсли;
		ОписаниеСвойства = СтрРазделить(СтрокаМакета, РазделительПолей);
		Ключ = ОписаниеСвойства[0];
		Синонимы = Новый Массив;
		Для Сч = 1 По ОписаниеСвойства.Количество() - 1 Цикл
			Синонимы.Добавить(ОписаниеСвойства[Сч]);
		КонецЦикла;
		Значение = СтрСоединить(Синонимы, ",");
		Результат.Вставить(Ключ, Значение);
	КонецЦикла;

	Возврат Результат;
КонецФункции

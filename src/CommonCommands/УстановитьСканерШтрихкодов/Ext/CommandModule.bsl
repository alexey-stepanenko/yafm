﻿//////////////////////////////////////////////////////////////////////////////// 
// ОБРАБОТЧИКИ СОБЫТИЙ
//

// обработка команды установки драйвера сканера штрихкодов
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды)

	// Подключение внешней компоненты
	НачатьУстановкуВнешнейКомпоненты(, "ОбщийМакет.ДрайверСканераШтрихкодов");

КонецПроцедуры

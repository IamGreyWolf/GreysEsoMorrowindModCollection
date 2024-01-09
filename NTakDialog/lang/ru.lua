--	Bindings
ZO_CreateStringId("SI_BINDING_NAME_REPEAT_DIALOG", "Повтор диалога")
ZO_CreateStringId("SI_BINDING_NAME_TOGGLE_BODY_HIDDEN", "Показать/Спрятать текст диалога")


--	Options
NTDial_Texts = {
  	optionError = "NTakDialog: Заданный значок не найден. Пожалуйста, добавьте комментарий к аддону на esoui.com и укажите этот номер: #",
	isNeeded	= " должен быть активирован.",
	doNothing	= "Ничего не делать",
	dontUse		= "Не использовать",
	dontDisplay = "Не показывать",
	choicesAlign = {	
		"Слева",
		"По центру",
		"Справа",
	},
	optionRepeat	= "<Повторить.>",
	optionRestart	= "<Перезапустить.>",
	cat00 = {
		title	= "Общие настройки для всех персонажей",
	},
	cat0 = {
		title	= "История разговоров",
		opt0	= "Показать историю в диалоговом окне",
		opt0b	= "Display only last reply",
		opt1	= "Префикс выбранных опций",
		opt2	= "Отображаемые имена",
		opt3	= "… и перейти на новую строку",
		optA	= "Вывод истории в чат",
	},
	catX = {
		optTextSize	= "Изменение размера (0 = по умолчанию)",
		optAlignH	= "Horizontal Выравнивание", 			-- TODO	
		optPaddingH	= "Horizontal Отступ (в пикселях)",		-- TODO	
		optPaddingV	= "Vertical Отступ (в пикселях)", 		-- TODO
	},
	cat1 = {
		title	= "Настройки окна",
		opt1	= "Настроить размер окна",
		warn1	= "Отключение приведет к перезагрузке интерфейса для восстановления значений по умолчанию.",
		opt2	= "Ширина (в %, ~47 по умолчанию)",
		opt3	= "Высота (в %, 30 по умолчанию)",
		opt4	= "Вертикальное смещение (в %, 0 по умолчанию)",
		opt10	= "Использовать свои отступы",
		opt11	= "Использовать авто отступы",
		opt12	= "Отступ слева (в пикселях, 10 по умолчанию)",
		opt13	= "Отступ справа (в пикселях, 30 по умолчанию)",
		opt21	= "Прозрачность фона (в %)",
		opt22	= "Прозрачность контента (в %)",
	},
	cat2 = {
		title	= "Настройки имен",
		opt4	= "Очищать имена",
		opt5	= "Использовать альтернативные цвета",
	},
	cat3 = {
		title	= "Настройки текста",
		opt11	= "Удалить весь текст (слушай!)",
		opt12	= "Использовать задержку ", -- opt20
		opt20	= "Постепенный вывод текста",
		opt21	= "Расширить окно при появлении текста",
		opt22	= "Задержка перед началом (в мс)",
		opt23	= "Задержка на букву (в мс)",
		opt24	= "Степень затухания (в буквах)",
		opt25	= "Мгновенное отображение при нажатии клавиши выбора",
		-- desc2	= "Note that you can instantly display all the text when pressing an option number during its fading animation.",
	},
	cat4 = {
		title	= "Настройки вариантов выбора",
		optA	= "Отображать мгновенно",
		optB	= "Отображение после появления основного текста",
		optC	= "Отображение при нажатии клавиши выбора",
		optD	= "Длительность угасания (в мс, 0 по умолчанию)",
        opt4	= "Вариант “Уйти” серого цвета",
		optR0	= "Добавить вариант “Повторить”",
		warnR0	= "Эта опция будет работать только при щелчке мышью (пока). Если вы хотите использовать клавиатуру, вы можете привязать к ней клавишу через «Управление > Настройки клавиш».",
        optR1	= "Вариант «Повторить» серого цвета",
		opt11	= "Добавить иконки",
		desc11	= "Предварительный просмотр различных иконок:",
		opt12	= "Пробелы после иконки",
		opt21	= "Добавить номера",
		opt22	= "Стиль нумерации",
		desc22	= "“x” это цифра. Например: ",
		opt23	= "Пробелы после нумерации",
		opt31	= "Прозрачность (в %)",
	},
	cat5 = {
		title	= "Эффекты при наведении",
		opt1	= "Ширина границы (в пикселях, 2 по умолчанию)",
		opt2	= "Прозрачность фона",
		opt3	= "Фон на всю ширину",
	},
	cat6 = {
		title	= "Диалого-зависимые настройки",
		menu1	= "Банкиры",
		menu2	= "Торговцы/Ремесленники",
		menu3	= "Гильдейские торговцы",
		menu4	= "Хозяева конюшен",
		menu9	= "Описания",
		menuA	= "Квесты",
    	opt1	= "Отключить диалоги",
    	opt2	= "Открывать магазины автоматически",
		opt3	= "Ускорение затухания",
		opt4	= "Отображать мгновенно",
		optA1	= "Открывать квесты автоматически",
		optA2	= "Принимать квесты автоматически",
		optA3	= "Завершать квесты автоматически",
	},
}
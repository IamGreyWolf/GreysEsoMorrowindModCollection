﻿-- Translation by @snorunt361
local strings = {
	["SI_BINDING_NAME_TOGGLE_HARVENSQUESTJOURNAL"] = "Harven's Quest Journalを開く",
	["HARVEN_QUEST_JOURNAL_DONE_BY_NAME"] = " by <<1>>",
	["HARVEN_QUEST_JOURNAL_COMPLETED_AT_TIME"] = " <<1>> <<2>> に完了",
	["HARVEN_QUEST_JOURNAL_COMPLETED_AT_LOCATION"] = "<<l:1>>",
	["HARVEN_QUEST_JOURNAL_SENTENCE_END"] = ".",
	["HARVEN_QUEST_JOURNAL_REWARD_XP"] = "<<1>> <<1[Experience Point/Experience Points]>>",
	["HARVEN_QUEST_JOURNAL_REWARD_CP"] = "<<1>> <<1[Champion Experience Point/Champion Experience Points]>>",
	["HARVEN_QUEST_JOURNAL_REWARD_GOLD"] = "|t16:16:EsoUI/Art/currency/currency_gold.dds|t <<1>>",
	["HARVEN_QUEST_JOURNAL_CURRENT_QUESTS_TITLE"] = "進行中のクエスト",
	["HARVEN_QUEST_JOURNAL_COMPLETED_QUESTS_TITLE"] = "完了したクエスト",
	["HARVEN_QUEST_JOURNAL_CURRENT_QUESTS_KEYBIND"] = "進行中",
	["HARVEN_QUEST_JOURNAL_COMPLETED_QUESTS_KEYBIND"] = "完了済",
	["HARVEN_QUEST_JOURNAL_SORT_BY"] = "並び順:",
	["HARVEN_QUEST_JOURNAL_SORT_ALPHABETICALLY"] = "名前",
	["HARVEN_QUEST_JOURNAL_SORT_TIMEOFCOMPLETION"] = "完了した日時",
	["HARVEN_QUEST_JOURNAL_SORT_TIMEOFSTART"] = "開始した日時",
	["HARVEN_QUEST_JOURNAL_SORT_LEVEL"] = GetString(SI_ITEM_FORMAT_STR_LEVEL),
	["HARVEN_QUEST_JOURNAL_SORT_ASC"] = "昇順",
	["HARVEN_QUEST_JOURNAL_SET_FOCUS"] = "フォーカスする",
	["HARVEN_QUEST_JOURNAL_BACK"] = "戻る",
	["HARVEN_QUEST_JOURNAL_DELETE"] = "削除",
	["HARVEN_QUEST_JOURNAL_DELETE_QUEST"] = "Delete Quest",
	["HARVEN_QUEST_JOURNAL_DELETE_QUEST_CONFIRM"] = 'Are you sure you want to delete "<<1>>"?',
	["HARVEN_QUEST_JOURNAL_BOOK_SKIN"] = "本の種類",
	["HARVEN_QUEST_JOURNAL_BODY_FONT"] = "本文のフォント",
	["HARVEN_QUEST_JOURNAL_TITLE_FONT"] = "題名のフォント",
	["HARVEN_QUEST_JOURNAL_FONT_COLOR"] = "文字の色",
	["HARVEN_QUEST_JOURNAL_QUEST_NAME_COLOR"] = "クエスト名の色",
	["HARVEN_QUEST_JOURNAL_NPC_NAME_COLOR"] = "NPC名の色",
	["HARVEN_QUEST_JOURNAL_LIST_COMPLETED_QUESTS_CATEGORYIES"] = "完了したクエストをカテゴリ別に表示",
	["HARVEN_QUEST_JOURNAL_LIST_COMPLETED_QUESTS_CATEGORYIES_TOOLTIP"] = "カテゴリとゾーンの目次別になります。カテゴリ名、ゾーン名を選択するとその全てのクエストが開かれます。",
	["HARVEN_QUEST_JOURNAL_OPEN_FOCUSED_QUEST"] = "フォーカスしたクエストを開く",
	["HARVEN_QUEST_JOURNAL_SAVED_COMPLETED_DAILIES"] = "デイリークエストの保存",
	["HARVEN_QUEST_JOURNAL_COMPLETED_REPEATABLE"] = "繰り返しクエストの保存",
	["HARVEN_QUEST_JOURNAL_PLAY_EMOTE"] = "開いている間のエモート",
	["HARVEN_QUEST_JOURNAL_SHOW_MAIN_MENU"] = "メインメニューで開く"
}
local ZO_CreateStringId = ZO_CreateStringId
for id, text in pairs(strings) do
	SafeAddString(_G[id], text)
end

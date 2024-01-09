--	Bindings
ZO_CreateStringId("SI_BINDING_NAME_REPEAT_DIALOG", "Repeat the dialog")
ZO_CreateStringId("SI_BINDING_NAME_TOGGLE_BODY_HIDDEN", "Show/Hide body text")


--	Options
NTDial_Texts = {
  	optionError = "NTakDialog: No specific icon found. Please comment the addon on esoui.com and indicate this number: #",
	isNeeded	= " needs to be activated.",
	doNothing	= "Do nothing",
	dontUse		= "Don't use",
	dontDisplay = "Don't display",
	choicesAlign = {	
		"Left",
		"Center",
		"Right",
	},
	optionRepeat	= "<Ask to repeat.>",
	optionRestart	= "<Restart dialog.>",
	cat00 = {
		title	= "CROSS-CHARACTERS SETTINGS",
	},	
	cat0 = {
		title	= "Conversation history",
		opt0	= "Display history in dialog window",
		opt0b	= "Display only last reply",
		opt1	= "Prefix selected options",
		opt2	= "Display names",
		opt3	= "… and jump to new line",
		optA	= "Output history in chat",
	},
	catX = {
		optTextSize	= "Text size modification (0 = default)",
		optAlignH	= "Horizontal alignment",
		optPaddingH	= "Horizontal padding (in px)",		
		optPaddingV	= "Vertical padding (in px)",
	},
	cat1 = {
		title	= "Window tweaks",
		opt1	= "Customize window size",
		warn1	= "Disabling it will reload the UI to restore the default values.",
		opt2	= "Width (in %, ~47 is default)",
		opt3	= "Height (in %, 30 is default)",
		opt4	= "Vertical shift (in %, 0 is default)",
		opt10	= "Use custom paddings",
		opt11	= "Use automatic paddings",
		opt12	= "Left padding (in px, 10 is default)",
		opt13	= "Right padding (in px, 30 is default)",
		opt21	= "Background transparency (in %)",
		opt22	= "Content transparency (in %)",
	},
	cat2 = {
		title	= "Name tweaks",
		opt4	= "Clean-up name",
		opt5	= "Use the alternative colour",
	},
	cat3 = {
		title	= "Text tweaks",
		opt11	= "Remove all the text (listen!)",
		opt12	= "Use delays of ", -- opt20
		opt20	= "Progressive text display",
		opt21	= "Expand window as text appears",
		opt22	= "Delay before starting (in ms)",
		opt23	= "Delay per letter (in ms)",
		opt24	= "Extent of the fading effect (in letters)",
		opt25	= "Instant display when pressing an option key",
		-- desc2	= "Note that you can instantly display all the text when pressing an option number during its fading animation.",
	},
	cat4 = {
		title	= "Options tweaks",
		optA	= "Display instantly",
		optB	= "Display after body text fade-in",
		optC	= "Display when pressing an option key",
		optD	= "Fading duration (in ms, 0 is default)",
        opt4	= "Grey out the “Goodbye” option",
		optR0	= "Add a “Repeat” option",
		warnR0	= "This option will only work when clicking it with the mouse (for now). If you wish to use the keyboard, you can bind a key for it in the “Controls > Addon Keybinds” settings.",
        optR1	= "Grey out the “Repeat” option",
		opt11	= "Add icons",
		desc11	= "Preview of the different icons used:",
		opt12	= "Spaces after the icon",
		opt21	= "Add numbers",
		opt22	= "Numbering style",
		desc22	= "“x” is the number. Examples: ",
		opt23	= "Spaces after the numbering",
		opt31	= "Transparency (in %)",
	},
	cat5 = {
		title	= "Options hovering effect",
		opt1	= "Borders width (in px, 2 is default)",
		opt2	= "Background opacity",
		opt3	= "Full width background",
	},
	cat6 = {
		title	= "Specific dialogs settings",
		menu1	= "Bankers",
		menu2	= "Merchants/Crafters",
		menu3	= "Guild traders",
		menu4	= "Stable masters",
		menu9	= "Descriptions",
		menuA	= "Quests",
    	opt1	= "Mute dialogs",
    	opt2	= "Open stores automatically",
		opt3	= "Speed-up fading",
		opt4	= "Display instantly",
		optA1	= "Open quests automatically",
		optA2	= "Accept quests automatically",
		optA3	= "Complete quests automatically",
	},
}
running
initializeSecretsFromEnvironmentGetter: getter

	| get |
	get := [:key |
		(getter value: key) ifNil: [
			self error: ('Secret <1p> not specied' expandMacrosWith: key)]].

	botToken := get value: 'TB_TEST_BOT_TOKEN'.
	
	clientChatId := (get value: 'TB_TEST_CLIENT_CHAT_ID') asInteger.
	botChatId := (get value: 'TB_TEST_BOT_CHAT_ID') asInteger.
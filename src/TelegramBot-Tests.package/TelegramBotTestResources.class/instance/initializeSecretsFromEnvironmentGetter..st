running
initializeSecretsFromEnvironmentGetter: getter

	| get |
	get := [:key |
		(getter value: key) ifNil: [
			self error: ('Secret <1p> not specied' expandMacrosWith: key)]].

	botToken := get value: 'TB_TEST_BOT_TOKEN'.
	
	clientPhoneNumber := get value: 'TB_TEST_CLIENT_NUMBER'.
	clientAuthCode := get value: 'TB_TEST_CLIENT_AUTH_CODE'.
	clientChatId := get value: 'TB_TEST_CLIENT_CHAT_ID'.
	botChatId := get value: 'TB_TEST_BOT_CHAT_ID'.
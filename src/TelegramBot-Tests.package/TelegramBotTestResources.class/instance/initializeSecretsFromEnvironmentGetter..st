running
initializeSecretsFromEnvironmentGetter: getter

	botToken := getter value: 'TB_TEST_BOT_TOKEN'.
	
	clientPhoneNumber := getter value: 'TB_TEST_CLIENT_NUMBER'.
	clientAuthCode := getter value: 'TB_TEST_CLIENT_AUTH_CODE'.
	clientChatId := getter value: 'TB_TEST_CLIENT_CHAT_ID'.
	botChatId := getter value: 'TB_TEST_BOT_CHAT_ID'.
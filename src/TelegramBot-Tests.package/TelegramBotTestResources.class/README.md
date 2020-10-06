I provide several fixtures and secrets for testing the TelegramBot package.

Developer note:
To declare the required globals, you can implement the instance-side message #initializeLocalSecrets on this class:

initializeLocalSecrets

	botToken := '<your bot id>:<your bot token>'. "retrieved from @BotFather"
	
	clientPhoneNumber := 123456. "this is your phone number!"
	clientAuthCode := 24680. "retrieved from Telegram/service notifications (+42777)"
	clientChatId := 9876543210. "retrieved from TelegramClient (explore it: aTCUMain chatsList last id)"
	botChatId := 123456789. "retrieved from TelegramBot (explore it: aBot getUpdates first message chat id)"

It is recommended to put this method into an extension category of the package User-Objects to avoid committing it by accident.
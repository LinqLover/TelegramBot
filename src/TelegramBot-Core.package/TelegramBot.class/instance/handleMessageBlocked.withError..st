update processing
handleMessageBlocked: aMessage withError: anError

	self messageBlocked: aMessage withError: anError.
	
	TelegramBotAbort signal: #chat.
	
	^ aMessage
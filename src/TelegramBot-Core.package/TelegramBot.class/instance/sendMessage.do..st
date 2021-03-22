private
sendMessage: aMessage do: aBlock

	^ aBlock
		on: TelegramBotError
		satisfying: [:ex | ex errorCode = 403 "Forbidden: bot was blocked by the user"]
		do: [:ex | self handleMessageBlocked: aMessage withError: ex]
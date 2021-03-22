update handling
messageBlocked: aMessage withError: anError
	"Hook. Sent when the attempt to send a bot message was rejected because the recipient has blocked the bot. Subclasses may override this."

	^ TelegramBotFailure signalForException: anError
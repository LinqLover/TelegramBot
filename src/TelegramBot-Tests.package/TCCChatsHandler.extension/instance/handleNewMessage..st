*TelegramBot-Tests-event handling-override
handleNewMessage: anEvent

	"Fix: Make sure unsupported messages are displayed even if the chat is already open when they arrive.
	Override method; needs to be commited back to the TelegramClient package when Metacello works again."
	| message |
	message := anEvent at: 'message'.
	self addNewMessage: message.
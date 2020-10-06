*TelegramBot-Tests-converting
asTelegramBotMessageEntityFor: aText

	^ JsonObject new
		type: #textLink;
		url: self url;
		yourself
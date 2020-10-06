message sending
sendObject: anObject toChat: aChat

	^ self
		sendMessage: (anObject asTelegramBotMessageFor: self)
		toChat: aChat
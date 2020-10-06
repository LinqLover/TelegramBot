message sending
sendText: aStringOrText toChat: aChat

	^ self
		sendMessage: (self messageWithText: aStringOrText)
		toChat: aChat
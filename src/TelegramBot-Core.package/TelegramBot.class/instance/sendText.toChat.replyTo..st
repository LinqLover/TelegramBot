message sending
sendText: aStringOrText toChat: aChat replyTo: referenceMessage

	^ self
		sendMessage: (self messageWithText: aStringOrText)
		toChat: aChat
		replyTo: referenceMessage
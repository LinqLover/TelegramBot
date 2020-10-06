message sending
sendPhoto: aForm withCaption: aStringOrText toChat: aChat

	^ self
		sendMessage: (self messageWithPhoto: aForm caption: aStringOrText)
		toChat: aChat
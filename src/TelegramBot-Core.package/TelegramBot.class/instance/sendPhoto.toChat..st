message sending
sendPhoto: aForm toChat: aChat

	^ self
		sendMessage: (self messageWithPhoto: aForm)
		toChat: aChat
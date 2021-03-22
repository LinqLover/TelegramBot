message sending
sendAudio: aSound toChat: aChat

	^ self
		sendMessage: (self messageWithAudio: aSound)
		toChat: aChat
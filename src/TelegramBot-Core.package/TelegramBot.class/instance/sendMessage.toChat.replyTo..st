message sending
sendMessage: aMessage toChat: aChat replyTo: referenceMessage

	^ self
		sendMessage: (aMessage beReplyTo: referenceMessage)
		toChat: aChat
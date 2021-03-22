message sending
sendMessage: aMessage toChat: aChat

	^ self sendMessage: aMessage do: [
		(aMessage chat: aChat) sendWith: self]
message sending
sendMessage: aMessage toChat: aChat

	^ (aMessage chat: aChat) sendWith: self
message sending
sendMessage: aMessage

	^ self sendMessage: aMessage do: [
		aMessage sendWith: self]
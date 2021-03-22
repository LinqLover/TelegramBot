message sending
editMessage: aMessage text: aStringOrText

	^ self sendMessage: aMessage do: [
		aMessage editText: aStringOrText with: self]
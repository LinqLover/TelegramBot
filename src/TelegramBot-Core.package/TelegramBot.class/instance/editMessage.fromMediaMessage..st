message sending
editMessage: aMessage fromMediaMessage: aMediaMessage

	aMessage isMediaMessage ifFalse: [
		^ self error: 'Adding media to a message is currently not supported by the API.'].
	^ aMessage editMediaFrom: aMediaMessage with: self
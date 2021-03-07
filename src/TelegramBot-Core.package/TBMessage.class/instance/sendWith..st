sending
sendWith: aBot

	^ self
		basicSend: 'sendMessage'
		args: (self buildArgumentsWith: aBot)
		with: aBot
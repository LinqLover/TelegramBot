sending
basicSend: messageName args: args with: aBot

	^ self
		basicSend: messageName
		args: args
		with: aBot
		thenDo: [self triggerEvent: #sent with: aBot]
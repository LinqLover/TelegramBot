sending
sendWith: aBot

	^ self
		basicSend: ('send{1}' format: {self type capitalized})
		args: (self buildArgumentsWith: aBot)
		with: aBot
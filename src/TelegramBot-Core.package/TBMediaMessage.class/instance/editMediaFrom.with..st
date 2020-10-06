sending
editMediaFrom: aMediaMessage with: aBot

	| args |
	args := OrderedDictionary new.
	self addMessageTo: args.
	args at: #media put: (aMediaMessage asInputMediaWith: aBot args: args).
	^ self
		basicSend: 'editMessageMedia'
		args: args
		with: aBot
		thenDo: [self media: aMediaMessage media]
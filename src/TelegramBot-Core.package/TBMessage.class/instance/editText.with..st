sending
editText: aStringOrText with: aBot

	| args |
	args := OrderedDictionary new.
	self addMessageTo: args.
	self
		addText: aStringOrText
		to: args
		with: aBot.
	^ self
		basicSend: ('editMessage{1}' format: {self textSelector})
		args: args
		with: aBot
		thenDo: [self text: aStringOrText]
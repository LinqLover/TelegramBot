sending
sendWith: aBot

	| args |
	args := OrderedDictionary new.
	self addAddressTo: args.
	self
		addText: self text
		to: args
		with: aBot.
	^ self basicSend: 'sendMessage' args: args with: aBot
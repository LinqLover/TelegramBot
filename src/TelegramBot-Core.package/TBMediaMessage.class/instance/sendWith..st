sending
sendWith: aBot

	| args |
	args := OrderedDictionary new.
	self addAddressTo: args.
	args at: self type put: self asMimeDocument.
	self text ifNotNil: [:stringOrText | self
		addText: stringOrText
		to: args
		with: aBot].
	^ self
		basicSend: ('send{1}' format: {self type capitalized})
		args: args
		with: aBot
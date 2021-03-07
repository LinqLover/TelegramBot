private
buildArgumentsWith: aBot

	| args |
	args := OrderedDictionary new.
	
	self addAddressTo: args.
	self
		addText: self text
		to: args
		with: aBot.
	self addOptionsTo: args.
	
	^ args
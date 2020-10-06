converting
asInputMediaWith: aBot args: args

	| media document |
	media := Dictionary new.
	media at: #type put: self type.
	
	document := self asMimeDocument.
	args at: self type put: document.
	media at: #media put: ('attach://{1}' format: {self type}).
	
	self text ifNotNil: [:stringOrText |
		"Old text needs to be attached again or it will be lost"
		self addText: stringOrText to: media with: aBot].
	
	^ media
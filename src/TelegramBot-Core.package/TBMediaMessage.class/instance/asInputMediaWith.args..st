converting
asInputMediaWith: aBot args: args

	| media document |
	media := Dictionary new.
	media at: #type put: self type.
	
	document := self asMimeDocument.
	args at: self type put: document.
	media at: #media put: ('attach://{1}' format: {self type}).
	
	"Existing text needs to be attached again to prevent it from removal"
	self addText: self text to: media with: aBot.
	
	^ media
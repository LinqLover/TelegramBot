private
buildArgumentsWith: aBot

	^ (super buildArgumentsWith: aBot)
		at: self type put: self asMimeDocument;
		yourself
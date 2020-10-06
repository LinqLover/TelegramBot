printing
description

	^ String streamContents: [:stream |
		| message |
		stream print: self class.
		
		self errorCode ifNotNil: [:code |
			stream space; print: code].
		
		message := self messageText.
		self messageText isEmptyOrNil ifFalse: [
			stream nextPutAll: ': '; nextPutAll: message]]
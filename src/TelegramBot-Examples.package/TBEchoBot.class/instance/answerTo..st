private
answerTo: aStringOrText

	^ self answerBlock
		ifNil: [aStringOrText]
		ifNotNil: [:block | block value: aStringOrText]
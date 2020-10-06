message creation
messageWithPhoto: aForm caption: aStringOrText

	^ (self messageWithPhoto: aForm)
		text: aStringOrText;
		yourself
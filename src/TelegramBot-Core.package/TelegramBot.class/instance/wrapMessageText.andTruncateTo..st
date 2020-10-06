converting
wrapMessageText: aStringOrText andTruncateTo: wrappedLimit

	^ (0 to: wrappedLimit)
		transform: [:limit |
			self wrapMessageText: (
				aStringOrText tbPrintStringAbsolutelyLimitedTo: limit)]
		firstSatisfyingDelta: [:wrappedText | wrappedLimit - wrappedText size]
		ifNone: [aStringOrText isText
			ifTrue: [self wrapMessageText: aStringOrText asString andTruncateTo: wrappedLimit]
			ifFalse: [self error: 'This text seems to be way too long']]
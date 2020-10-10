*TelegramBot-Core-enumerating
transform: aBlock firstSatisfyingDelta: anotherBlock

	^ self
		transform: aBlock
		firstSatisfyingDelta: anotherBlock
		ifNone: [self errorNotFound: anotherBlock]
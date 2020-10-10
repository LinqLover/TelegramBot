*TelegramBot-Core-enumerating
transform: aBlock firstSatisfyingDelta: anotherBlock ifNone: exceptionBlock

	^ self
		findDeltaFirst: [:element | anotherBlock value: (aBlock value: element)]
		do: aBlock
		ifNone: exceptionBlock
*TelegramBot-Core-enumerating
transform: aBlock firstSatisfyingBinary: anotherBlock ifNone: exceptionBlock

	^ self
		findBinaryFirst: [:element | anotherBlock value: (aBlock value: element)]
		do: aBlock
		ifNone: exceptionBlock
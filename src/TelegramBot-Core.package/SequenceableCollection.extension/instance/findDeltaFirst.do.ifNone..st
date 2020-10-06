*TelegramBot-Core-enumerating
findDeltaFirst: aBlock do: actionBlock ifNone: exceptionBlock

	^ self
		findDeltaFirstIndex: aBlock
		do: [:foundIndex | actionBlock value: (self at: foundIndex)]
		ifNone: exceptionBlock
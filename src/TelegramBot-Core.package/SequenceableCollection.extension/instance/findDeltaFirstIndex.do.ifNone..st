*TelegramBot-Core-enumerating
findDeltaFirstIndex: aBlock do: actionBlock ifNone: exceptionBlock

	^ self
		findDeltaIndex: [:element | (aBlock value: element)
			in: [:test | test isZero ifTrue: [-1] ifFalse: [test]]]
		do: [:result | self error: 'Should not reach this place']
		ifNone: [:low :high | low isZero
			ifTrue: exceptionBlock
			ifFalse: [actionBlock value: low]]
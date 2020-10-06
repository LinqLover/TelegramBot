*TelegramBot-Core-converting
tbApiToSqueak

	| squeakKey |
	squeakKey := self key tbApiKeyToSqueak.
	^ self species
		key: squeakKey
		value: (squeakKey
			caseOf: {
				[#date] -> [DateAndTime fromUnixTime: self value]. }
			otherwise: [self value tbApiToSqueak])
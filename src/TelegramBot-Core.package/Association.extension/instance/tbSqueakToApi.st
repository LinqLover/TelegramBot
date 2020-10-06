*TelegramBot-Core-converting
tbSqueakToApi

	^ self species
		key: self key tbSqueakToApiKey
		value: (self key
			caseOf: {
				[#date] -> [self value asUnixTime]. }
			otherwise: [self value tbSqueakToApi])
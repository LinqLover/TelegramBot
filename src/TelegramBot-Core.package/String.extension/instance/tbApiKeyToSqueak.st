*TelegramBot-Core-converting
tbApiKeyToSqueak

	| features |
	features := self findTokens: '_'.
	^ (String new: self size - features size + 1 streamContents: [:out |
		features readStream in: [:in |
			out nextPutAll: in next asLowercase.
			in do: [:feature |
				out nextPutAll: feature capitalized]]]) asSymbol
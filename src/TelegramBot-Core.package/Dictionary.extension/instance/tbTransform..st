*TelegramBot-Core-converting
tbTransform: aBlock

	| json |
	json := self species new: self size.
	self associationsDo: [:assoc |
		json add: (aBlock value: assoc)].
	^ json
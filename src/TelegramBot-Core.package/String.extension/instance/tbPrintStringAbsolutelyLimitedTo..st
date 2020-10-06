*TelegramBot-Core-printing
tbPrintStringAbsolutelyLimitedTo: limit

	| ellipsis |
	self size < limit ifTrue: [^ self].
	
	ellipsis := '...etc...'.
	^ (self first: limit - ellipsis size) , ellipsis
*TelegramBot-Core-printing
tbPrintStringAbsolutelyLimitedTo: limit

	| limitedString ellipsis |
	limitedString := String streamContents: [:s | self printOn: s] limitedTo: limit.
	limitedString size < limit ifTrue: [^ limitedString].
	
	ellipsis := '...etc...'.
	^ (limitedString first: limit - ellipsis size) , ellipsis
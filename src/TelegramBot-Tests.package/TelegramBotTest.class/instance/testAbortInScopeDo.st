tests
testAbortInScopeDo

	| x |
	TelegramBotAbort inScope: #foo do: [
		x := 1.
		TelegramBotAbort signal: #bar.
		x := 2.
		TelegramBotAbort signal: #foo.
		x := 3].
	
	self assert: 2 equals: x.
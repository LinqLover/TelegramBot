tests
testAbortDefaultAction

	[ [TelegramBotAbort signal: #foo]
		on: TelegramBotAbort
		do: #defaultAction ]
		ifCurtailed: [self fail].
tests
testEcho

	| message |
	message := '{1} {2}' format: {self. DateAndTime now}.
	self
		shouldBotAsked: {message}
		answer: {message}.
tests
testUnicodeMessage

	| message |
	message := self resource fixtureUnicodeText.
	self
		shouldBotAsked: {message}
		answer: {message}.
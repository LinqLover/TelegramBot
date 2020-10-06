tests
testEchoPluggableAnswer

	| message |
	bot answerBlock: [:text | '<{1}>' format: {text asString}].
	message := '{1} {2}' format: {self. DateAndTime now}.
	self
		shouldBotAsked: {message}
		answer: {bot answerBlock value: message}.
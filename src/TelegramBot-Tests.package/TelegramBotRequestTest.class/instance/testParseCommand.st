tests
testParseCommand

	| textCommand mainText text message found |
	textCommand := '/foo@', bot name.
	mainText := 'bar'.
	
	text := ('{1} {2}' asText format: {
		textCommand asText
			addAttribute: (TBTextCommand readFrom: textCommand forBotNamed: bot name);
			yourself.
		mainText}).
	message := JsonObject new
		at: #text put: text;
		yourself.
	
	self
		assert: (mockBot
			parseCommandIn: message
			ifFound: [:command | found := command])
		equals: found.
	self
		assert: #foo equals: found key;
		assert: bot name equals: found botName.
	self
		assert: text equals: message text asString;
		assert: mainText equals: message mainText asString.
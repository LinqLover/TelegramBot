update handling
handleCommand: aCommand message: aMessage

	^ aCommand key
		caseOf: {
			[#start] -> [self doStart: aMessage] }
		otherwise: [super handleCommand: aCommand message: aMessage]
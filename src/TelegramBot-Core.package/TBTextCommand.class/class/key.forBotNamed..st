instance creation
key: aString forBotNamed: botName

	^ self new
		key: aString asSymbol;
		botName: botName;
		yourself
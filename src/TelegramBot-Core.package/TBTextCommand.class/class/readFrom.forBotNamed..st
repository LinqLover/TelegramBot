instance creation
readFrom: aString forBotNamed: botName

	^ self new
		botName: botName;
		readFrom: aString
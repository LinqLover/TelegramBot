sending
basicSend: messageName args: args with: aBot thenDo: aBlock

	| result |
	result := aBot
		sendBasicMessage: messageName
		args: args.
	
	self assert: result from username = aBot name.
	self readFromJson: result.
	aBlock cull: result.
	
	^ self
printing
messageText

	^ messageText ifNil: [self exception description]
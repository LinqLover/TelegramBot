update processing
handleMessage: aMessage

	aMessage text ifNotNil: [:text |
		self parseCommandIn: aMessage ifFound: [:command |
			(self handlesMessage: aMessage)
				ifFalse: [^ self].
			
			^ self handleCommand: command message: aMessage]].
	
	(self handlesMessage: aMessage)
		ifFalse: [^ self].
	
	self messageReceived: aMessage.
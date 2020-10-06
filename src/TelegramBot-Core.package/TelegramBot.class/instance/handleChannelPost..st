update processing
handleChannelPost: aMessage

	(self handlesChannelPost: aMessage)
		ifFalse: [^ self].
	
	self channelPostReceived: aMessage.
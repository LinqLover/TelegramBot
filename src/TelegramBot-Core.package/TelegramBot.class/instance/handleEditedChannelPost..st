update processing
handleEditedChannelPost: aMessage

	(self handlesChannelPost: aMessage)
		ifFalse: [^ self].
	
	self channelPostEdited: aMessage.
update processing
handleEditedMessage: aMessage

	(self handlesMessage: aMessage)
		ifFalse: [^ self].
	
	self messageEdited: aMessage.
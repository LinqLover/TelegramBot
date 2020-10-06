private
addAddressTo: args

	args at: #chatId put: self chatId.
	
	self referenceMessageId ifNotNil: [:id |
		args at: #replyToMessageId put: id].
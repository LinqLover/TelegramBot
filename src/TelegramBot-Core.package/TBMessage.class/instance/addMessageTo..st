private
addMessageTo: args

	args
		at: #chatId put: self chatId;
		at: #messageId put: self messageId.
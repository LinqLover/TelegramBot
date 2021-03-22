update processing
processUpdatesLimitedTo: maxUpdates chunkSize: chunkSize timeout: timeout

	^ self
		processUpdatesLimitedTo: maxUpdates
		chunkSize: chunkSize
		do: [:update | TelegramBotAbort
			inScope: #chat
			do: [self handleUpdate: update]]
		timeout: timeout
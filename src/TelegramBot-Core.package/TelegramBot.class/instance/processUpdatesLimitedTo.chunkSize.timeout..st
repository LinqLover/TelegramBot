update processing
processUpdatesLimitedTo: maxUpdates chunkSize: chunkSize timeout: timeout

	^ self
		processUpdatesLimitedTo: maxUpdates
		chunkSize: chunkSize
		do: [:update | self handleUpdate: update]
		timeout: timeout
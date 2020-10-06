update processing
processUpdatesWithin: timeout

	^ self
		processUpdatesLimitedTo: 1000
		chunkSize: 100
		timeout: timeout
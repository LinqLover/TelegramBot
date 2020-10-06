update processing
processUpdatesLimitedTo: maxUpdates chunkSize: chunkSize do: aBlock

	^ self
		processUpdatesLimitedTo: maxUpdates
		chunkSize: chunkSize
		do: aBlock
		timeout: self shortPollingTimeout
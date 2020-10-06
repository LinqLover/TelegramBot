update processing
getUpdates

	^ OrderedCollection streamContents: [:stream |
		self processUpdatesLimitedTo: 1000 chunkSize: 100 do: [:update |
			stream nextPut: update]]
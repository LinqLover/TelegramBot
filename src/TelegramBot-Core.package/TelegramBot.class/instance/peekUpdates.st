update processing
peekUpdates
	"Peek incoming updates, without removing them from the processing queue. For debugging purposes."

	| previousUpdateId |
	previousUpdateId := latestUpdateId.
	^ OrderedCollection streamContents: [:stream |
		[(self request: 'getUpdates') do: [:update |
			stream nextPut: update]]
				ensure: [latestUpdateId := previousUpdateId]]
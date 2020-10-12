update processing
processUpdatesLimitedTo: maxUpdates chunkSize: chunkSize do: aBlock timeout: timeout

	| updates updateCount |
	updateCount := 0.
	[| args |
	args := Dictionary new
		at: #allowedUpdates put: self handledUpdateTypes;
		at: #limit put: chunkSize;
		at: #timeout put: timeout asSeconds;
		yourself.
	latestUpdateId ifNotNil: [:id |
		args at: #offset put: id + 1].
	updates := self request: 'getUpdates' timeout: timeout args: args.
	updates ifEmpty: [
		latestUpdateTime := DateAndTime now.
		^ self].
	updates do: aBlock.
	latestUpdateId := (updates collect: #updateId) max]
		doWhileTrue: [(updateCount := updateCount + updates size) < maxUpdates].
	^ self error: 'Incoming update count exceeded limit'
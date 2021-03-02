update cycle
doOneCycle

	latestUpdateTime ifNotNil: [:time |
		DateAndTime now - time <= self serverCacheTtl ifFalse: [
			self notify: 'Time since latest update outrun cache TTL (time to live) of the API server. Make sure to choose a lower update interval.']].
	
	[self processUpdatesWithin: self longPollingTimeout]
		on: Error do: [:ex | TelegramBotFailure signalForException: ex].
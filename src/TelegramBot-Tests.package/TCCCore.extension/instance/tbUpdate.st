*TelegramBot-Tests-events
tbUpdate
	"Process the next available update, if any. Answer true if an event was available; otherwise, false."

	| event |
	event := self client receive: 0.05.
	event ifNotNil: [self handleEvent: (TCCEvent newFromTDLibEvent: event)].
	^ event notNil
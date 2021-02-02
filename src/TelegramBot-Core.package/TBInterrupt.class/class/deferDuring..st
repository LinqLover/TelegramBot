support
deferDuring: aBlock

	| deferred |
	deferred := nil.
	^ [aBlock on: self do: [:interrupt |
			deferred := interrupt.
			interrupt resume]]
		ensure: [deferred ifNotNil: #signal]
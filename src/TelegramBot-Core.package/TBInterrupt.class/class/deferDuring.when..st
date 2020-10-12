support
deferDuring: aBlock when: anotherBlock

	| deferred |
	deferred := nil.
	^ [aBlock
		on: self
		satisfying: anotherBlock
		do: [:interrupt |
			deferred := interrupt.
			interrupt resume]]
		ensure: [deferred ifNotNil: #signal]
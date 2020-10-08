*TelegramBot-Core-exceptions-override
on: exceptionOrExceptionSet when: aPredicate do: handlerAction

	^ self
		on: exceptionOrExceptionSet
		do: [:exception |
			(aPredicate value: exception)
				ifTrue: [handlerAction cull: exception]
				ifFalse: [exception pass]]
priv handling
defaultActionWithDelay

	| delay result |
	delay := self networkWaitTime asDelay schedule.
	result := super defaultAction.
	delay delaySemaphore wait.
	^ result
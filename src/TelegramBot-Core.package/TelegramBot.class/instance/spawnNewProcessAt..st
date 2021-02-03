update cycle
spawnNewProcessAt: priority

	(process isNil or: [process isTerminated]) ifFalse: [
		self error: 'Already running!'].
	
	^ process := [
		[self doOneCycle. Processor yield] repeat.
	] newProcess
		name: ('Telegram Bot process for {1}' format: {self name});
		priority: priority;
		resume;
		yourself
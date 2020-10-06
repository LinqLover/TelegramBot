system startup
shutDown: quitting during: aBlock
	"Shut down the receiver while the system and shut down and started up during aBlock. If a process is running, give it a chance to process already retrieved updates and then suspend it."

	| semaphore |
	quitting ifFalse: [
		^ aBlock value].
	(process isNil
		or: [process isSuspended]
		or: [process isTerminated])
		ifTrue: [
			^ aBlock value].
	
	semaphore := Semaphore new.
	process
		tbSetPriority: Processor activePriority + 1
		during: [
			process signalException: (TBInterrupt forBlock: [semaphore wait])].
	^ aBlock ensure: [
		semaphore signal]
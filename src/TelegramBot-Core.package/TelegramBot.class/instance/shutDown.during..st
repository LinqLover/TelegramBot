system startup
shutDown: quitting during: aBlock
	"Shut down the receiver while the system and shut down and started up during aBlock. If a process is running, give it a chance to process already retrieved updates and then suspend it."

	| semaphore blocker |
	quitting ifFalse: [
		^ aBlock value].
	(process isNil
		or: [process isSuspended]
		or: [process isTerminated]
		or: [process == Processor activeProcess])
		ifTrue: [
			^ aBlock value].
	
	semaphore := Semaphore new.
	blocker := Semaphore new.
	process
		tbSetPriority: Processor activePriority + 1
		during: [
			process signalException: (TBInterruptRequest forBlock: [
				blocker signal.
				semaphore wait])].
	blocker wait.
	^ aBlock ensure: [
		semaphore signal]
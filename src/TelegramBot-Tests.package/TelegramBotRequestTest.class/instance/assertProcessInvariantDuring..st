asserting
assertProcessInvariantDuring: aBlock

	| oldProcesses |
	oldProcesses := Process allInstances reject: #isTerminated.
	^ aBlock ensure: [
		| newProcesses |
		newProcesses := Process allInstances reject: #isTerminated.
		self assert: oldProcesses equals: newProcesses]
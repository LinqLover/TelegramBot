*TelegramBot-Core-accessing
tbSetPriority: priority during: aBlock

	| priorPriority |
	priorPriority := self priority.
	self priority: priority.
	^ aBlock ensure: [
		self priority: priorPriority]
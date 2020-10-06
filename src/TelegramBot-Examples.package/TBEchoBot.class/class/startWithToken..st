examples
startWithToken: aToken
	"TBEchoBot startWithToken: 'mybot:mysecrettoken'"

	| bot |
	bot := self withToken: aToken.
	bot spawnNewProcess inspect
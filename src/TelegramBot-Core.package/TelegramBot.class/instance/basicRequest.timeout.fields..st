requests
basicRequest: url timeout: timeout fields: fields

	| json response actualFields |
	actualFields := fields collect: [:value |
		(value isCollection and: [value isString not])
			ifTrue: [value asJsonString]
			ifFalse: [value]].
	
	"Run the web request atomically against interrupts to preserve it from damage after the connection has been suspended."
	response := TBInterrupt
		deferDuring: [WebClient httpDo: [:client |
			client timeout: (timeout + self defaultTimeout) asSeconds.
			actualFields
				ifNotEmpty: [client httpPost: url multipartFields: actualFields]
				ifEmpty: [client httpGet: url]]].
	
	self flag: #todo.
	"Handle 'SocketPrimitiveFailed: primSocketReceiveDataAvailable:' + NoNetworkError+ ConnectionTimedOut here after host system shutdown?"
	"502 Bad Gateway is a known sporadic error. Ignore unless occurs permanently?"
	"ConnectionTimedOut/ConnectionRefused also occuring sporadically, retry mechanism?"
	
	json := Json readFrom: response content readStream.
	json ok ifFalse: [
		TelegramBotError
			signal: (json at: 'error_code')
			message: (json at: 'description')].
	^ json result
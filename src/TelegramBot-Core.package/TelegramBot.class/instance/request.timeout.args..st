requests
request: type timeout: timeout args: args

	^ self convertApiToSqueak: (self
		basicRequest: ('{1}/bot{2}/{3}' format: {
			self serverUrl. token. type})
		timeout: timeout
		fields: (self convertSqueakToApi: args))
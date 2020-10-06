requests
request: type args: args

	^ self
		request: type
		timeout: self shortPollingTimeout
		args: args
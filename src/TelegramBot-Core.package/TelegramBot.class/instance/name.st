accessing
name

	^ name ifNil: [
		name := (self request: 'getMe') username]
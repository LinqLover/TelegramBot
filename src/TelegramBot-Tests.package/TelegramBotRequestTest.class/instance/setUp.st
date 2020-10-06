running
setUp

	super setUp.
	
	bot := TBEchoBot withToken: self resource botToken.
	
	mockBot := TBMockBot new.
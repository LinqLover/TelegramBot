running
tearDownClient

	[self receiveClientMessages] ifError: []. "throw up 🤮"
	[client client free] ifError: [].
running
setUpClient

	[client := self createClient.
	client tbUpdateAll.
	self waitForClientAuthorization: #isAuthorizationStateReady.
	self receiveClientMessages] ifCurtailed: [
		[client client free] ifError: []].
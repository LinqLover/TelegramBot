running
tearDown

	[self tearDownClient.
	self tearDownBot] ensure: [
		super tearDown]
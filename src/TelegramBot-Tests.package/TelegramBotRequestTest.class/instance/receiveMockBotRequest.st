private
receiveMockBotRequest

	self assert: mockBot requests size = 1.
	^ mockBot requests first
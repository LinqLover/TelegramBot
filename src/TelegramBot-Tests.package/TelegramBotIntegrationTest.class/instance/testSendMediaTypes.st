tests
testSendMediaTypes

	#(fixtureAudio fixturePhoto) do: [:sel |
		| media |
		media := self resource perform: sel.
		self testSendMedia: media].
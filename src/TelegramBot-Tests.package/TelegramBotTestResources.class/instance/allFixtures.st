fixtures
allFixtures

	^ self allFixtureSelectors collect: [:selector |
		self perform: selector]
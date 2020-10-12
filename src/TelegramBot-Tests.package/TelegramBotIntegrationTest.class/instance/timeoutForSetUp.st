accessing
timeoutForSetUp

	^ super timeoutForSetUp + (self clientAuthTimeout * 2) asSeconds
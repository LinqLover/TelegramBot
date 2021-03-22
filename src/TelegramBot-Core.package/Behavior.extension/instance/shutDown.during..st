*TelegramBot-Core-system startup-pseudo-override
shutDown: quitting during: aBlock

	self shutDown: quitting.
	^ aBlock ensure: [
		self startUp: quitting]
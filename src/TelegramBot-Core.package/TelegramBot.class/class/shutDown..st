system startup
shutDown: quitting
	"The system is being shut down. Shut down all subinstances of the receiver, too."

	self allSubInstancesDo: [:bot |
		bot shutDown: quitting].
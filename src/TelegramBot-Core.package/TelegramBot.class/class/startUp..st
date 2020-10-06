system startup
startUp: resuming
	"The system is being started up again. Start up all subinstances of the receiver, too."

	self allSubInstancesDo: [:bot |
		bot startUp: resuming].
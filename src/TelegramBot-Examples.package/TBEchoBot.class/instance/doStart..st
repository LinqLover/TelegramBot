commands
doStart: aMessage

	self
		sendText: 'Welcome to the EchoBot!\\This bot does not have a real purpose but is made for demonstrating the framework of the Telegram Bot API for Squeak.' withCRs
		toChat: aMessage chat.
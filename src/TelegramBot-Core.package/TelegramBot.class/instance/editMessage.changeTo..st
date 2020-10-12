message sending
editMessage: oldMessage changeTo: newMessage

	(oldMessage text ~= newMessage text or: [oldMessage truncated ~= newMessage truncated]) ifTrue: [
		oldMessage truncated: newMessage truncated.
		self editMessage: oldMessage text: newMessage text].
	
	((oldMessage isMediaMessage or: [newMessage isMediaMessage])
		and: [oldMessage content ~= newMessage content])
		ifTrue: [
			newMessage isMediaMessage ifFalse: [
				self error: 'Removing media from a message is currently not supported by the API. Try deleting the whole message instead, or exchange the media with a dummy object instead.'].
			[self editMessage: oldMessage fromMediaMessage: newMessage]
				on: TelegramBotError
				satisfying: [:ex | ex messageText includesSubstring: 'message is not modified:']
				do: ["Old and new media are identical from the perspective of the API; well, that's not a problem. We could try to check this before, but EAFP > LBYL. See also this thread: http://forum.world.st/Overriding-in-Graphics-and-Sounds-td5122783.html"]].
	
	self flag: #extend. "replyMarkup, liveLocation"
	
	newMessage messageId: oldMessage messageId.
	newMessage triggerEvent: #sent with: self.
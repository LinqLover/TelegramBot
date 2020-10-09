support
receiveClientMessages

	| messages |
	client tbUpdateAll.
	messages := (client chats getChat: self resource clientChatId) messages.
	Transcript showln: 'received: '.
	messages do: [:message |
		Transcript showln: String tab; show: message id -> message message].
	
	lastMessageId ifNotNil: [
		messages := messages select: [:msg | msg id > lastMessageId]].
	messages ifNotEmpty: [
		lastMessageId := (messages collect: #id) max].
	
	^ messages collect: #message
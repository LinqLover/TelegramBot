*TelegramBot-Core
asTelegramBotMessageFor: aBot

	^ aBot messageWithAnimation: (ByteArray streamContents: [:stream |
		AnimatedGIFReadWriter
			putForms: self images
			andDelays: self delays
			onStream: stream])
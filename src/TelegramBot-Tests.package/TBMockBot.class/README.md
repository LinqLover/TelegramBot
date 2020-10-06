I provide mocking functionality to the abstract TelegramBot class. Instead of connecting to the API, test classes can provide fake updates to me and read my received messages.

My current existence is probably an indicator of the brain-class-likeness of TelegramBot. In a future design revision, I might be replaced by something like a TBMockBotConnector or so.
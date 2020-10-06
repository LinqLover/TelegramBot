I implement a bot's functionality for the Telegram messenger. I am capable of receiving and sending updates from the Telegram Bot API, converting them between a REST API representation and the framework representation, dispatching the updates to specialized selectors, and doing all of this in an independent loop.

I am an abstract superclass. Developers subclass me and override certain hooks such as #messageReceived:, #handleCommand:message: and other selectors from the 'update handling' protocol. See TBEchoBot for an example implementation.

To start and stop my update loop, send #spawnNewProcess and #terminate to initialized instances of myself. For debugging purposes, you might also want to send #doOneCycleNow or #peekUpdates.

NOTE: SwaLint criticizes that I show symptoms of a god or brain class, and it couldn't be more right with this finding. In future design revisions, I might benefit from an extraction of the low-level API connection code into a separate class. This would also make it more easier to test me.
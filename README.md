# TelegramBot

[![Actions Status](https://github.com/LinqLover/TelegramBot/workflows/smalltalkCI/badge.svg)](https://github.com/LinqLover/TelegramBot/actions)
[![Coverage Status](https://coveralls.io/repos/github/LinqLover/TelegramBot/badge.svg?t=r7aDq3)](https://coveralls.io/github/LinqLover/TelegramBot)

A [Telegram](https://telegram.org/) Bot framework for [Squeak/Smalltalk](https://squeak.org).
Supports receiving, sending, and editing of multi-media messages such as photos, formatted text, and files.
Provides a robust server mode to keep bot servers running in the background of your Smalltalk image.
Basic support for group chats and channel posts.

Used by the [TelegramSmalltalkBot](https://github.com/LinqLover/TelegramSmalltalkBot).

## Installation

Install the latest Trunk updates in your image before installing the repository:

### ... using [Metacello](https://github.com/Metacello/metacello)

```smalltalk
Metacello new
	baseline: 'TelegramBot';
	githubUser: 'LinqLover' project: 'TelegramBot' path: 'src';
	load.
```

### ... as a dependency in your [Metacello baseline](https://github.com/dalehenrich/metacello-work/blob/master/docs/GettingStartedWithGitHub.md#create-baseline)

```smalltalk
spec baseline: 'TelegramBot' with: [
	spec repository: 'github://LinqLover/TelegramBot/src'].
```

## Usage

For a simple example, see the class `TBEchoBot` from the system category `TelegramBot-Examples`.
To run the bot, you first need to create a bot with the help of [@BotFather](https://t.me/BotFather).
After that, you can run this or any other bot by evaluating the following in a workspace:

```smalltalk
bot := TBEchoBot withToken: '<your_bot_token>'.
bot spawnNewProcess.
```

You can also terminate the bot again by sending `#terminate` to it, or invoke it manually for one update cycle using the `#doOneCycleNow` message.
For the full protocol, browse the message category `update cycle` on `TelegramBot`.

If you do not want that everyone from all over the world has access to your bot, you can define an allow-list of chat IDs and provide it via the `TBTestBotChatIds` global variable (experimental):

```smalltalk
Smalltalk at: #TBTestBotChatIds put: #(<your_chat_id_integer>).
```

You can find out your own chat ID by browsing the sessions object of your running bot instance using an object explorer, or by inspecting the result of `bot peekUpdates` after sending a message to the bot.

## Documentation

... is still to be done. :-) In a nutshell: When building your bot, subclass from `TelegramBot`. Relevant hooks to override are defined in the `update handling` protocol and you can use the messages from the `message sending` protocol to send replies to users.

To learn more about the possibilites of Telegram bots, take a look at the official documentation of the [Telegram Bot API](https://core.telegram.org/bots/api).

**Disclaimer:** Since this framework is still under development, breaking design changes are possible. Make sure to browse all open issues and to watch the repository when you start working with this framework.

## Development

This framework is still under development.
Nevertheless, all kinds of contributions are already very welcome!
Please submit as much bug reports, new feature proposals, or even pull requests as possible. :-)

Version control is run using [Squot](https://github.com/hpi-swa/Squot).

## Nice idea, but it this framework actually used by any project?

TelegramBot was mainly developed to build [TelegramSmalltalkBot](https://github.com/LinqLover/TelegramSmalltalkBot), a bot which allows you to access a remote Squeak and execute Smalltalk expressions in it:

<a href="https://t.me/SqueakSmalltalkBot"><img src="https://github.com/LinqLover/TelegramSmalltalkBot/raw/master/img/banner.svg" height="50px" alt="@SqueakSmalltalkBot"></img></a>

However, this framework has not been abstracted from TelegramSmalltalkBot for nothing, so it should be definitively usable for other bots as well.
If you have developed another bot using this framework, please feel free to create a PR that references your project!

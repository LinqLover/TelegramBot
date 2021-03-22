baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec
			package: 'JSON' with: [
				spec repository: 'https://www.squeaksource.com/PostgresV3'];
			baseline: 'TelegramClient' with: [
				spec
					repository: 'github://hpi-swa-teaching/TelegramClient/packages';
					loads: 'TelegramClient-Core'].
		
		"packages"
		spec
			package: 'TelegramBot-Core' with: [
				spec requires: #('JSON').
				spec postLoadDoIt: #installPreviewDependencies];
			package: 'TelegramBot-Support-ShoutAttribute' with: [
				"Support for the ShoutAttribute changeset which has not yet been added to Trunk: http://forum.world.st/Changeset-ShoutAttribute-amp-semi-styling-td5106776.html"];
			package: 'TelegramBot-Examples' with: [
				spec requires: #(minimal)];
			package: 'TelegramBot-Tests' with: [
				spec requires: #(default 'TelegramClient')].
		
		"groups"
		spec
			group: #default with: #('TelegramBot-Core' 'TelegramBot-Examples');
			group: #minimal with: #('TelegramBot-Core');
			group: #tests with: #(minimal 'TelegramBot-Tests')].
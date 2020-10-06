baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec
			package: 'JSON' with: [
				spec repository: 'https://www.squeaksource.com/PostgresV3'];
			package: 'ShoutAttribute' with: [
				"Support for the ShoutAttribute changeset which has not yet been added to Trunk: http://forum.world.st/Changeset-ShoutAttribute-amp-semi-styling-td5106776.html"
				spec repository: 'https://gist.githubusercontent.com/LinqLover/f2a0a189a00aa1484b481c805629e517/raw/e7850041758e02a536a0e32b54bf0b99785bebc3/ShoutAttribute.cs'];
			package: 'TelegramClient' with: [
				spec repository: 'github://hpi-swa-teaching/TelegramClient/packages'].
		
		"packages"
		spec
			package: 'TelegramBot-Core' with: [
				spec requires: #('JSON')];
			package: 'TelegramBot-Support-ShoutAttribute' with: [
				spec requires: #('ShoutAttribute')];
			package: 'TelegramBot-Examples';
			package: 'TelegramBot-Tests' with: [
				spec requires: #('TelegramClient')].
		
		"groups"
		spec
			group: #default with: #('TelegramBot-Core' 'TelegramBot-Examples');
			group: #minimal with: #('TelegramBot-Core');
			group: #tests with: #(minimal 'TelegramBot-Tests' 'TelegramBot-Examples')].
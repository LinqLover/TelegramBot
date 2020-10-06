baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec
			package: 'JSON' with: [
				spec repository: 'https://www.squeaksource.com/PostgresV3'].
		
		"packages"
		spec
			package: 'TelegramBot-Core' with: [
				spec requires: #('JSON')];
			package: 'TelegramBot-Examples';
			package: 'TelegramBot-Tests'.
		
		"groups"
		spec
			group: #default with: #('TelegramBot-Core' 'TelegramBot-Examples');
			group: #minimal with: #('TelegramBot-Core');
			group: #tests with: #(minimal 'TelegramBot-Tests' 'TelegramBot-Examples')].
baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec
			package: 'JSON' with: [
				spec repository: 'https://www.squeaksource.com/PostgresV3'];
			package: 'ShoutAttribute' with: [
				spec repository: 'https://gist.githubusercontent.com/LinqLover/f2a0a189a00aa1484b481c805629e517/raw/e7850041758e02a536a0e32b54bf0b99785bebc3/ShoutAttribute.cs'].
		
		"packages"
		spec
			package: 'TelegramBot-Core' with: [
				spec requires: #('JSON')];
			package: 'TelegramBot-Support-ShoutAttribute' with: [
				spec requires: #('ShoutAttribute')];
			package: 'TelegramBot-Examples';
			package: 'TelegramBot-Tests'.
		
		"groups"
		spec
			group: #default with: #('TelegramBot-Core' 'TelegramBot-Examples');
			group: #minimal with: #('TelegramBot-Core');
			group: #tests with: #(minimal 'TelegramBot-Tests' 'TelegramBot-Examples')].
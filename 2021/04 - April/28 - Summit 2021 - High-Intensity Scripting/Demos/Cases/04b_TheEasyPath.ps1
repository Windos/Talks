$PSVersion = $PSVersionTable.PSVersion;

[Version] $TestVersion = '5.1.15000';

$PSVersion -ge $TestVersion;
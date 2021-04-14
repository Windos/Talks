$PSVersion = $PSVersionTable.PSVersion;

[Version] $TestVersion = '7.1.3';

$PSVersion -ge $TestVersion;
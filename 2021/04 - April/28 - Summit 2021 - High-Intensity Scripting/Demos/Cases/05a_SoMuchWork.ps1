$PSVersion = $PSVersionTable.PSVersion;

$TestVersion = '5.1.15000';

$SplitVersion = $TestVersion.Split('.');

if ($PSVersion.Major -ge $SplitVersion[0]) {
    if ($PSVersion.Minor -ge $SplitVersion[1]) {
        if ($PSVersion.Build -ge $SplitVersion[2]) {
            $true
        } else {
            $false
        }
    } else {
        $false
    }
} else {
    $false
}
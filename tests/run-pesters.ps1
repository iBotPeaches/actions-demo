Install-Module Pester -Force -Scope CurrentUser -RequiredVersion 4.10.1
Import-Module Pester
$Path="./python-tests.ps1";
Test-Path $Path -PathType Leaf

Invoke-Pester -Script $Path
# -OutputFile "test_results.xml"
# -OutputFormat NUnitXml

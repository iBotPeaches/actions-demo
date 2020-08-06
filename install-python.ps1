function Download-File {
    param(
        [Parameter(Mandatory=$true)]
        [Uri]$Uri,
        [Parameter(Mandatory=$true)]
        [String]$OutputFolder
    )

    $targetFilename = [IO.Path]::GetFileName($Uri)
    $targetFilepath = Join-Path $OutputFolder $targetFilename

    Write-Debug "Download source from $Uri to $OutFile"
    try {
        (New-Object System.Net.WebClient).DownloadFile($Uri, $targetFilepath)
        return $targetFilepath
    } catch {
        Write-Host "Error during downloading file from '$Uri'"
        "$_"
        exit 1
    }    
}

function GetPkgUri() {
	return "https://www.python.org/ftp/python/3.8.5/python-3.8.5-macosx10.9.pkg"
}

function Download() {
	<#
	.SYNOPSIS
	Download Python pkg. Returns the downloaded file location path.
	#>

	$pkgUri = GetPkgUri()
	Write-Host "pkg URI: $pkgUri"

	$pgkFilepath = Download-File -Uri $pkgUri -OutputFolder '/tmp'

	Write-Debug "Done; pkg location: $pkgFilepath"

	return $pgkFilepath
}

function Build() {
	Write-Host "Download Python $($this.Version)[$($this.Architecture)] pkg..."
	$pkgLocation = Download()

	Write-Host "Install Python $($this.Version)[$($this.Architecture)] pkg..."
	Execute-Command -Command "sudo installer -pkg $pkgLocation -target /"
}

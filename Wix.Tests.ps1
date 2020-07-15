Import-Module -Name ImageHelpers -Force



Describe "Wix" {
    function Get-WixVersion {
      $regKey = "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
      $installedApplications = Get-ItemProperty -Path $regKey
      $Version = ($installedApplications | Where-Object { $_.DisplayName -and $_.DisplayName.toLower().Contains("wix") } | Select-Object -First 1).DisplayVersion
      return $Version
    }
    
    It "Wix Toolset version from registry" {
      $WixToolSetVersion = Get-WixVersion
      "$WixToolSetVersion" | Should -Not -Be ""
    }
    It "Wix Toolset version from system" {
      if (Test-IsWin19)
      {
        $exVersion = Get-VSExtensionVersion -packageName "WixToolset.VisualStudioExtension.Dev16"
      }
      else
      {
        $exVersion = Get-VSExtensionVersion -packageName "WixToolset.VisualStudioExtension.Dev15"
      }
      "$exVersion" | Should -Not -Be ""
    }
}

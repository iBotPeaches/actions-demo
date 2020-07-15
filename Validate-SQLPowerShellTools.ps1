# Validate the installation
Describe 'Validate SQLPowerShellTools' {
  BeforeAll {
    $env:PSModulePath = Get-SystemVariable "PSModulePath"
  }
  It 'The SQLPS module exists' {
     $modules = Get-Module -Name SQLPS -ListAvailable
     $modules.Count | Should -Be 1
  }
}

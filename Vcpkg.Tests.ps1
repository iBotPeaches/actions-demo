
Describe "Vcpkg" {
    It " vcpkg" {
      "vcpkg version" | Should -ReturnZeroExitCode
    }
    It "env varibale VCPKG_INSTALLATION_ROOT is set" {
      "$env:VCPKG_INSTALLATION_ROOT" | Should -Not -Be ""
    }
}

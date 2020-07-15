
Describe "SSDTExtensions" {
#These extensions don't have any proper name in the state.packages.json file, only id is available, which can be found on extension marketplace download page
    $id1 = "04a86fc2-dbd5-4222-848e-911638e487fe"
    $id2 = "851E7A09-7B2B-4F06-A15D-BABFCB26B970"
    $id3 = "717ad572-c4b7-435c-c166-c2969777f718"
    It "Extensions id=$id1" {
      $version = Get-VSExtensionVersion -packageName "$id1"
      "$version" | Should -Not -Be ""
    }
    It "Extensions id=$id2" {
      $version = Get-VSExtensionVersion -packageName "$id2"
      "$version" | Should -Not -Be ""
    }
    It "Extensions id=$id3" {
      $version = Get-VSExtensionVersion -packageName "$id3"
      "$version" | Should -Not -Be ""
    }
}

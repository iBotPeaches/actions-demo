
Describe "SSDTExtensions" {
#These extensions don't have any proper name in the state.packages.json file, only id is available, which can be found on extension marketplace download page
    $Global:id1 = "04a86fc2-dbd5-4222-848e-911638e487fe" 
    $Global:id2 = "851E7A09-7B2B-4F06-A15D-BABFCB26B970"
    $Global:id3 = "717ad572-c4b7-435c-c166-c2969777f718"
    
    It "Extensions id=${Global:id1}" {
    # TODO: replace with variables
      $version = Get-VSExtensionVersion -packageName ${Global:id1}
      "$version" | Should -Not -Be ""
    }
    It "Extensions id=${Global:id2}" {
      $version = Get-VSExtensionVersion -packageName ${Global:id2}
      "$version" | Should -Not -Be ""
    }
  # TODO: not found
  #  It "Extensions id=$id2" {
  #    $version = Get-VSExtensionVersion -packageName "851e7a09-7b2b-4f06-a15d-babfcb26b970"
  #    "$version" | Should -Not -Be ""
  #  }
}

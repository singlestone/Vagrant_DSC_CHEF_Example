$global:progressPreference = 'SilentlyContinue'

describe 'minimal::font' {
  context 'windows_font' {

    it "installs CodeNewRoman"  {
      "c:/windows/fonts/CodeNewRoman.otf" | Should Exist
    }
    it "installs Asimov"  {
      "c:/windows/fonts/Asimov.otf" | Should Exist
    }
  }
}

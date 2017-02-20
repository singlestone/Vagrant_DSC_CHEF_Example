
$description = "description"
$short_description = "short_description"
$name = "name"
$version = "version"


$file = ".\test.json"



$json = (Get-Content $file -Raw) | ConvertFrom-Json
$json.versions.Count
$json.versions[0].providers[0].name



#      output: "windows_2012_r2_{{.Provider}}.box"
#      Final oputput convention {{.NAME}}_{{.Provider}}_{{.Version}}.box





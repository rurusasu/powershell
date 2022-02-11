$ErrorActionPreference = "stop"

try {
  $result = choco
  Write-Output $result
}
catch {
  Write-Output "catch!!"
  Write-Output $Error[0]
}


#$result = choco

#echo $result

#Remove-Item C:\ProgramData\chocolatey
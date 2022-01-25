# この値を 'stop' にすることで、エラーの発生とともに処理が中断される。
$ErrorActionPreference = "stop"
#$package_file = (Convert-Path .\package_install.ps1)

Write-Output "セキュリティを一時的に緩めます。"
# セキュリティ設定を一時的に緩める
Set-ExecutionPolicy AllSigned -Scope Process -Force

# もし、Chocolateyがインストールされていない場合
try {
  $result = choco
  Write-Output $result
}
catch {
  Write-Output "Chocolateyをインストールします。"
  # Chocolateyをインストールする
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

try {
  $result = choco
  Write-Output $result

  #Start-Process -FilePath powershell -ArgumentList $package_file -Verb runas
  # .configファイルの内、更新日が最新のものを変数に格納
  $ChildItems = (Get-ChildItem . -Recurse *.config | Sort-Object LastWriteTime -Descending)[0].FullName

  try {
    choco install -y $ChildItems
  }
  catch {
    Write-Output "パッケージのインストールに失敗しました。"
    Write-Output $Error[0]
  }
}
catch {
  Write-Output "Chocolateyのインストールに失敗しました。"
  Write-Output $Error[0]
}

Write-Output "セキュリティ設定をもとに戻します。"
# セキュリティ設定を元に戻す
Set-ExecutionPolicy RemoteSigned

return $Error
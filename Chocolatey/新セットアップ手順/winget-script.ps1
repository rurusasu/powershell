<#
wingetでソフトを一括インストールするPowerShellスクリプト例 winget-install.ps1
wingetを使おう (中編:wingetでソフトを管理する)

$appListに挙げられているソフトを順にインストールしていきます。

Copyright (c) 2021 astherier
This software is released under the MIT License.
http://opensource.org/licenses/mit-license.php
#>

$appList = @(
  "Docker.DockerDesktop",
  "Google Chrome",
  "Mozilla.Firefox",
  "Mozilla.Thunderbird",
  "Microsoft.VisualStudioCod",
  "Sourcetree"
)

function exec_winget($app) {
  Write-Output "インストール開始：$app"
  & winget install $app
  if ($LastExitCode -eq 0) {
    $result = "インストール成功：$app"
  }
  else {
    $result = "インストール失敗：$app"
  }
  Write-Output $result
  $script:exec_result += $result
}

$exec_result = @()
foreach ($app in $appList) {
  exec_winget $app
}
Write-Output "インストールがすべて終了しました。"
Write-Output $exec_result
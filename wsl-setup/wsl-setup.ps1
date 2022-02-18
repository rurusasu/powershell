<#
.SYNOPSIS

この単純なスクリプトを使用して、wslを簡単にセットアップすることができます。

.DESCRIPTION

wsl-setupは，wslのセットアップとUbuntu 20.04のインストールまでを行うシンプルなスクリプトで，これらは winget を用いることで同様のセットアップを行うことができます．

Author: Kohei Miki

.EXAMPLE

./wsl-setup.ps1

.NOTES

スクリプトはメニュー方式です。スクリプトを実行してメニューオプションを選択するだけです。

#>


$appList = @(
  "Docker.DockerDesktop"
  "9P9TQF7MRM4R", # Windows Subsystem for Linux Preview
  "9N6SVWS3RX71" # Ubuntu 20.04
)

# install function
function exec_install($app) {
  Write-Output "インストール開始：$app"
  & winget install $app --accept-package-agreements
  if ($LastExitCode -eq 0) {
    $result = "インストール成功：$app"
  }
  else {
    $result = "インストール失敗：$app"
  }
  Write-Output $result
  $script:exec_result += $result
}

# uninstall function
function exec_uninstall {
  Write-Output "アンインストール開始：$app"
  & winget uninstall $app
  if ($LastExitCode -eq 0) {
    $result = "アンインストール成功：$app"
  }
  else {
    $result = "アンインストール失敗：$app"
  }
  Write-Output $result
  $script:exec_result += $result
}

# Setup
function Setup {
  $exec_result = @()
  foreach ($app in $appList) {
    exec_install $app
  }
  Write-Output "セットアップが正常に終了しました。"
  Write-Output $exec_result
  pause
}

# ReSetup
function Uninstall {
  # app uninstall
  $exec_result = @()
  foreach ($app in $appList) {
    exec_uninstall $app
  }
  Write-Output "アンインストールが正常に終了しました。"
  Write-Output $exec_result
  pause
}

# ReSetup
function ReSetup {
  # app uninstall
  $exec_result = @()
  foreach ($app in $appList) {
    exec_uninstall $app
  }
  Write-Output "アンインストールが正常に終了しました。"
  Write-Output $exec_result
  pause

  # app install
  Setup
}

# pause
function Pause {
  Write-Host -NoNewLine "Press any key to continue...`n"
  $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Quit
function quit {
  exit
}

function Menu {
  # Clear the screen
  Clear-Host

  Write-Host " "
  Write-Host "Please select a Setup. `n"
  Write-Host "1 = Setup"
  Write-Host "2 = Uninstall"
  Write-Host "3 = ReSetup"
  Write-Host "Q = Quit `n"

  $input = Read-Host -Prompt "Selection"
  Write-Host "`n"
  if ("$input" -like "1") { Setup }
  if ("$input" -like "2") { Uninstall }
  if ("$input" -like "3") { ReSetup }
  if ("$input" -like "Q") { quit }
  else {
    Menu
  }
}
Menu
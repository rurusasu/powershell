<#
.SYNOPSIS

この単純なスクリプトを使用して、WindowsUpdateを実行することができます。

.DESCRIPTION

WindowsUpdateは，管理者として powershell を再起動し，再起動の必要がない WindowsUpdate の更新パッケージをインストールするシンプルなスクリプトで，これらは 更新プログラム を用いることで同様の操作を行うことができます．

Author: Kohei Miki

.EXAMPLE

./WindowsUpdate.ps1

.NOTES


.REF
Get-Module: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-module?view=powershell-7.2
#>
function WindowsUpdate {
  $ModuleName = "PSWindowsUpdate"

  # Clear the screen
  Clear-Host

  Write-Host "WindowsUpdate を開始します．"

  # モジュールがインストールされていない場合、
  # インストールする
  If (-not(Get-InstalledModule $ModuleName -ErrorAction silentlycontinue)) {
    Write-Output "$ModuleName をインストールします．"
    Install-Module $ModuleName -Confirm:$False -Force
  }

  # Import-Module を実行し、PowerShell の現在のセッションに
  # PSWindowsUpdate モジュールをインポートします。
  Import-Module PSWindowsUpdate

  Get-WindowsUpdate -AcceptAll
}


if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) {
  Start-Process pwsh.exe "-File `"$PSCommandPath`"" -Verb RunAs
  exit
}

WindowsUpdate

# 再起動の必要がない場合は更新を行う．
$res = Get-WURebootStatus
if ( - ! $res.RebootRequired) {
  Write-Host "再起動の必要がない更新パッケージが存在しました．"
  Write-Host "アップデートを行います．"
  Install-WindowsUpdate -AcceptAll
}

# 更新履歴を表示する
$res = Get-WUhistory
Write-Host $res

# デバッグ用に、閉じる前に止める。
Pause
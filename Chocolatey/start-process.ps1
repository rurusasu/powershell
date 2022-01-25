# この値を 'stop' にすることで、エラーの発生とともに処理が中断される。
$ErrorActionPreference = "stop"

# 管理者権限で実行したいファイルのパス
$file = (Convert-Path .\choco_install.ps1)
Write-Output $file

try {
    # PowerShellを管理者権限で実行
    #$result = Start-Process -FilePath powershell -ArgumentList $file -Verb runas
    $proc = Start-Process -FilePath powershell -ArgumentList $file -Verb runas

    #Write-Output $result.GetType()
    Write-Output $proc
}
catch {
    Write-Output $Error[0]
}


# スクリプト実行後、自動的にPowerShellが閉じないようにする
pause
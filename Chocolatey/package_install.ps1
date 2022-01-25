# この値を 'stop' にすることで、エラーの発生とともに処理が中断される。
$ErrorActionPreference = "stop"

# .configファイルの内、更新日が最新のものを変数に格納
$ChildItems = (Get-ChildItem . -Recurse *.config | Sort-Object LastWriteTime -Descending)[0].FullName

try {
    choco install -y $ChildItems
}
catch {
    Write-Output "パッケージのインストールに失敗しました。"
    Write-Output $Error[0]
}
# windows にインストールされているアプリケーションの名前を取得するためのコマンド

Get-AppxPackage | `
  Sort-Object Name | Select-Object Name | `
  Export-Csv ".\Windows-apps.csv" -Encoding UTF8 -UseQuotes Never
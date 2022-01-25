# Linux用のWindowsサブシステムを有効にする
Write-Output "Linux用のWindowsサブシステムを有効にします．"
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# 仮想マシン機能を有効にする
Write-Output "仮想マシン機能を有効にします．"
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Linux カーネル更新プログラムパッケージをダウンロードする
Write-Output "Linux カーネル更新プログラムパッケージをダウンロードします．"
Invoke-WebRequest -Uri "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi" -OutFile C:\Users\$env:UserName\Downloads\wsl_update_x64.msi
# カーネル更新プログラムパッケージをインストールする
# .msiを動かす参考: https://qiita.com/sakineko/items/e26bc14c51160531df08
Write-Output "カーネル更新プログラムパッケージをインストールします．"
cmd /c msiexec.exe /i C:\Users\$env:UserName\Downloads\wsl_update_x64.msi

# WSL 2 を既定のバージョンとして設定する
Write-Output "WSL 2 を既定のバージョンとして設定します．"
wsl --set-default-version 2

# WSLを最新バージョンに更新
wsl --update

# 更新後，WSLを再起動
wsl --shutdown

# WSLコマンド一発でlinuxカーネルがインストール可能に
# 参考: https://forest.watch.impress.co.jp/docs/news/1342078.html
# インストール可能なディストリビューションを一覧表示
# wsl --list --online
# linuxディストリビューションをインストール
# wsl --install -d Ubuntu-20.04
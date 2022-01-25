Write-Output "セキュリティを一時的に緩めます。"
# セキュリティ設定を一時的に緩める
Set-ExecutionPolicy RemoteSigned -Scope Process -Force

$providerList = @(
  # 'NuGet',
  'ChocolateyGet',
  'PowerShellGet'
  # 'Chocolatey'
)
$providerList | ForEach-Object { Install-PackageProvider $_ -Force }

Install-Package  -Force -ProviderName ChocolateyGet
# 特定のユーザがログオンした時のみに実行されるプログラム
$ret = Test-Path -LiteralPath "C:\Users\rurus\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

Write-Host $ret

# 全てのユーザがログオンした時に実行されるプログラム
$ret = Test-Path -LiteralPath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"

Write-Host $ret

#---------------#
# レジストリで登録
#---------------#
# レジストリを設定したユーザ
# キーの存在判定
$key = Test-Path -LiteralPath "HKCU:Software\Microsoft\Windows\CurrentVersion\Run"
$res = Get-ItemProperty -LiteralPath "HKCU:Software\Microsoft\Windows\CurrentVersion\Run"
Write-Host $res
if ("$key" -like "True") {

  # << Advanced SystemCare <<

  try{
  $item = Get-ItemProperty -LiteralPath "HKCU:Software\Microsoft\Windows\CurrentVersion\Run" -Name "Advanced SystemCare"
  Write-Host $item
  }
  catch{
    Write-Host "SystemCare does not exist."
  }
  #if ($item.ExecutionPolicy -ne "$null") {
  #  Remove-ItemProperty -LiteralPath "HKCU:Software\Microsoft\Windows\CurrentVersion\Run" -Name "Advanced SystemCare"
  #  Write-Host "Delete Advanced SystemCare"
  #}
  #else {
  #  Write-Host "SystemCare does not exist."
  #}
}

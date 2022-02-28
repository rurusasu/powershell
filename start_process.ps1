# 管理者権限でない場合、現在のスクリプトを管理者権限で実行して自分は終了
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  $commandPath = $PSCommandPath
  Write-Output ("not admin. restart as admin:" + $commandPath)

  # 引数を、管理者権限実行用に作り直す
  # 引数が、クォートされた空白を含む文字列である場合を想定。
  # そこまで考えないでいいなら、Start-Process の $argsToAdminProcess の代わりに$Argsを入れても問題ない。
  $argsToAdminProcess = ""
  $Args.ForEach{
    Write-Output ("not admin: args: " + $PSItem)
    $argsToAdminProcess += " `"$PSItem`""
  }

  # 実行
  Start-Process powershell.exe "-File `"$commandPath`" $argsToAdminProcess"  -Verb RunAs
  # デバッグ用に、閉じる前に止める。
  Pause
  exit
}

Write-Output "admin."

# 管理権限実行に渡ってきた引数を確認する
$Args.ForEach{
  Write-Output ("admin: args: " + $PSItem)
}

# デバッグ用に、閉じる前に止める。
Pause

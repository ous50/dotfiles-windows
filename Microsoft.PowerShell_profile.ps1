# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========

Push-Location (Split-Path -parent $profile)
"components-shell" | Where-Object {Test-Path "$_.ps1"} | ForEach-Object -process {Invoke-Expression ". .\$_.ps1"}
Pop-Location

# https://github.com/PowerShell/PSReadLine
# https://github.com/devblackops/Terminal-Icons
# https://github.com/vors/ZLocation
# https://github.com/PoshCode/Pansies
#Import-Module PSReadLine
#Import-Module Terminal-Icons
#Import-Module ZLocation
#Import-Module Pansies


# Readline and search histry commands
Set-PSReadlineOption -BellStyle None
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 2000
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete




# https://starship.rs/
Invoke-Expression (&starship init powershell)

# Anaconda3
(& conda 'shell.powershell' 'hook') | Out-String | Invoke-Expression

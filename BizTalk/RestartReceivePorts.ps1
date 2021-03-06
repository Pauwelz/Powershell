$SqlServer = "."
$DBName = "BizTalkMgmtDb"
$Application = "BizTalk Application 1"

$InitializeDefaultBTSDrive = $false
Add-PSSnapin –Name BizTalkFactory.PowerShell.Extensions
New-PSDrive -Name BizTalk -PSProvider BizTalk -Root BizTalk:\ -Instance $SqlServer -Database $DBName

Write-Host "Enabling Receive Locations for application" $Application
$path = "BizTalk:\Applications\" + $Application.ToString() + "\Receive Locations"
cd $path

$rls = Get-ChildItem 
foreach ($rl in $rls)
{
	Write-Host "Enabling" $rl.Name
	Enable-ReceiveLocation -Path $rl.PSPath
}

c:
Remove-PSDrive -Name BizTalk 
Remove-PSSnapin –Name BizTalkFactory.PowerShell.Extensions 

Write-Host "Finished"


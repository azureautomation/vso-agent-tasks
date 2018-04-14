param(
    [string][Parameter(Mandatory=$true)]$ConnectedServiceName,
    [string][Parameter(Mandatory=$true)]$ResourceGroupName,
    [string][Parameter(Mandatory=$true)]$AutomationAccountName,
    [string][Parameter(Mandatory=$true)]$RunbookName,
    [string][Parameter(Mandatory=$False)]$RunbookParameters = $null
)

$ErrorActionPreference = "Stop"

if ($RunbookParameters)
{
    # Create a hash table from the json values passed in
    $Parameters = @{}
    (ConvertFrom-Json $RunbookParameters).psobject.properties | ForEach-Object { $Parameters[$_.Name] = $_.Value }
    $Runbook = Start-AzureRmAutomationRunbook -ResourceGroupName $ResourceGroupName -AutomationAccountName $AutomationAccountName `
                                        -Name $RunbookName -Parameters $Parameters -Wait
}
else 
{
    $Runbook = Start-AzureRmAutomationRunbook -ResourceGroupName $ResourceGroupName -AutomationAccountName $AutomationAccountName `
                                        -Name $RunbookName -Wait
}
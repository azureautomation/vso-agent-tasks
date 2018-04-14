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
    $Parameters = @{}
    # Read json file passed in for the parameters
    $RunbookParameters = Get-Content -Path $RunbookParameters -Raw

    # Create a hash table from the json values passed in
    (ConvertFrom-Json $RunbookParameters).psobject.properties | ForEach-Object { $Parameters[$_.Name] = $_.Value }
    $Runbook = Start-AzureRmAutomationRunbook -ResourceGroupName $ResourceGroupName -AutomationAccountName $AutomationAccountName `
                                            -Name $RunbookName -Parameters $Parameters -Wait   
}
else 
{
    $Runbook = Start-AzureRmAutomationRunbook -ResourceGroupName $ResourceGroupName -AutomationAccountName $AutomationAccountName `
                                        -Name $RunbookName -Wait
}
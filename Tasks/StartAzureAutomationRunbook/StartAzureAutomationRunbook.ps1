
param(
    [string][Parameter(Mandatory=$true)]$ConnectedServiceName,
    [string][Parameter(Mandatory=$true)]$ResourceGroupName,
    [string][Parameter(Mandatory=$true)]$AutomationAccountName,
    [string][Parameter(Mandatory=$true)]$RunbookName,
    [string][Parameter(Mandatory=$False)]$RunbookParametersFile = $null,
    [string][Parameter(Mandatory=$False)]$OverwriteParameters = $null  
)

$ErrorActionPreference = "Stop"
$VerbosePreference = "Continue"

$Parameters = @{}
if (!([string]::IsNullOrEmpty($OverwriteParameters)))
{
    (ConvertFrom-Json $OverwriteParameters).psobject.properties | ForEach-Object { $Parameters[$_.Name] = $_.Value }    
}

if ($RunbookParametersFile.Split('.')[-1] -match "json")
{
    $ParametersFile = @{}
    # Read json file passed in for the parameters
    $RunbookParameters = Get-Content -Path $RunbookParametersFile -Raw 

    # Create a hash table from the json values passed in
    (ConvertFrom-Json $RunbookParameters).psobject.properties | ForEach-Object { $ParametersFile[$_.Name] = $_.Value }
    
    # Add in the parameters to the list if they don't already exist.
    foreach ($Param in $ParametersFile.Keys)
    {
        if ($Parameters[$Param] -eq $null)
        {
            $Parameters.Add($Param ,$ParametersFile[$Param])
        }
    }
}

if ($Parameters.Count -gt 0)
{
    $Runbook = Start-AzureRmAutomationRunbook -ResourceGroupName $ResourceGroupName -AutomationAccountName $AutomationAccountName `
                                        -Name $RunbookName -Parameters $Parameters -Wait  
}
else 
{
    $Runbook = Start-AzureRmAutomationRunbook -ResourceGroupName $ResourceGroupName -AutomationAccountName $AutomationAccountName `
                                        -Name $RunbookName -Wait
}
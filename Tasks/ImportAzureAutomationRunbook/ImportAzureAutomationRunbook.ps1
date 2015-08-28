param(
    [string][Parameter(Mandatory=$true)]$ConnectedServiceName,
    [string][Parameter(Mandatory=$true)]$ResourceGroupName,
    [string][Parameter(Mandatory=$true)]$AutomationAccountName,
    [string][Parameter(Mandatory=$true)]$RunbookType,
    [string][Parameter(Mandatory=$true)]$RunbookFile
)

$ErrorActionPreference = "Stop"
$VerbosePreference = "Continue"

Write-Verbose "Starting Azure Automation Runbook Import Task"

Write-Verbose "SubscriptionId = $ConnectedServiceName"
Write-Verbose "ResourceGroupName = $resourceGroupName"
Write-Verbose "AutomationAccountName = $AutomationAccountName"
Write-Verbose "RunbookType = $RunbookType"
Write-Verbose "RunbookFile = $RunbookFile"

$VerbosePreference = "SilentlyContinue"
Switch-AzureMode AzureResourceManager
$VerbosePreference = "Continue"

$Runbook = Import-AzureAutomationRunbook -ResourceGroupName $ResourceGroupName -AutomationAccountName $AutomationAccountName -Path $RunbookFile -Type $RunbookType -Published

Write-Verbose "Completing Azure Automation Runbook Import Task"

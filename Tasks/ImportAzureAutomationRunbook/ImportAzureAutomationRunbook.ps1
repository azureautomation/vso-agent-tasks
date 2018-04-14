param(
    [string][Parameter(Mandatory=$true)]$ConnectedServiceName,
    [string][Parameter(Mandatory=$true)]$ResourceGroupName,
    [string][Parameter(Mandatory=$true)]$AutomationAccountName,
    [string][Parameter(Mandatory=$true)]$RunbookPath
)

$ErrorActionPreference = "Stop"
$VerbosePreference = "Continue"

# Get all PowerShell scripts
$Runbooks = Get-ChildItem -Path $RunbookPath -File -Include ('*.ps1', '*.py') -Recurse -Depth 1

foreach ($Runbook in $Runbooks)
{
    if ($Runbook.Extension.ToLower() -eq ".py" )
    {
        Write-Verbose "File is Python"
        $RunbookType = "Python2"
    }
    else 
    {
        $AST = [System.Management.Automation.Language.Parser]::ParseFile($Runbook.FullName, [ref]$null, [ref]$null);
        if ($AST.EndBlock -ne $null -and $AST.EndBlock.Extent.Text.ToLower().StartsWith("workflow"))
        {
            Write-Verbose "File is a PowerShell workflow"
            $RunbookType = "PowerShellWorkflow"
        }

        if ($AST.EndBlock -ne $null -and (!($AST.EndBlock.Extent.Text.ToLower().StartsWith("workflow"))))
        {
            Write-Verbose "File is a PowerShell script"
            $RunbookType = "PowerShell"
        }
    }
    $Runbook = Import-AzureRMAutomationRunbook -ResourceGroupName $ResourceGroupName -AutomationAccountName $AutomationAccountName `
                                                -Path $Runbook.FullName -Type $RunbookType -Published -Force
}
Write-Verbose "Completing Azure Automation Runbook Import Task"

# Azure Automation start runbook job

## Overview

This task is used to start a runbook in Azure Automation. It can optionally take a parameters file required for the runbook entered in json form.
Example:

```PowerShell
Param (
    [Parameter(Mandatory=$False)]
    [String]
    $FirstName,

    [Parameter(Mandatory=$True)]
    [String]
    $LastName
)
Write-Output $FirstName
Write-Output $LastName
```
would take {'FirstName': 'John', 'LastName': 'Smith'} as the parameter json file for the runbook.

### The different parameters of the task are as described below

- **Azure Subscription:** Select the Azure Subscription where the runbook will be imported. This is a drop down of the subscriptions that have been added in the Services tab. See below Prerequisite section to know more about how to add Azure subscription through Services tab.

- **Resource Group** The name of the Resource Group where the runbook will be imported.

- **Automation Account** The name of the Automation account where the runbook will be imported.

- **Runbook Name** The name runbook in the Automation account to start.

- **Runbook Parameters** An optional json parameters file to pass to the runbook.


## Instructions

This task can be used in either the Build or Release process in Visual Studio Team Services.

## Prerequisite for the task

##### Azure Subscription
To deploy to Azure, an Azure subscription has to be linked to VSO using the Services tab in the Account Administration section.

Add the Azure subscription to use in the Build or Release tasks by opening the Account Administration screen (gear icon on the top-right of the screen) and then click on the Services tab. Select Azure from the Add New Service Connection dropdown.


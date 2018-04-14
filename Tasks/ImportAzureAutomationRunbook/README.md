# Azure Automation Runbook Import Task

### Overview

This task is used to import a runbook into Azure Automation, in published state. It will overwrite an existing runbook.

### The different parameters of the task are as described below

- **Azure Subscription:** Select the Azure Subscription where the runbook will be imported. This is a drop down of the subscriptions that have been added in the Services tab. See below Prerequisite section to know more about how to add Azure subscription through Services tab.

- **Resource Group** The name of the Resource Group where the runbook will be imported.

- **Automation Account** The name of the Automation account where the runbook will be imported.

- **Runbook Path** The path to the specific runbook or folder that contains runbooks to import into the Automation account.


### Prerequisite for the task

##### Azure Subscription
To deploy to Azure, an Azure subscription has to be linked to VSO using the Services tab in the Account Administration section.

Add the Azure subscription to use in the Build tasks by opening the Account Administration screen (gear icon on the top-right of the screen) and then click on the Services tab. Select Azure from the Add New Service Connection dropdown. 

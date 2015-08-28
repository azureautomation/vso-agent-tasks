# Azure Automation Runbook Import Task

### Overview

This task is used to import a runbook into Azure Automation, in published state.

### The different parameters of the task are as described below:

- **Azure Subscription:** Select the Azure Subscription where the runbook will be imported. This is a drop down of the subscriptions that have been added in the Services tab. See below Prerequisite section to know more about how to add Azure subscription through Services tab.

- **Resource Group** The name of the Resource Group where the runbook will be imported.

- **Automation Account** The name of the Automation account where the runbook will be imported.

- **Runbook File** The path to the runbook to import into Azure Automation.

- **Runbook Type** The type of runbook that is being imported.

### Prerequisite for the task

##### Azure Subscription
To deploy to Azure, an Azure subscription has to be linked to VSO using the Services tab in the Account Administration section.

Add the Azure subscription to use in the Build tasks by opening the Account Administration screen (gear icon on the top-right of the screen) and then click on the Services tab. Select Azure from the Add New Service Connection dropdown. 

Fill in the required details from the Azure account, and select credentials for authentication as certificates are not supported by Azure Resource Manager. **The credentials have to be a work account because Microsoft accounts like [joe@live.com]() or [joe@hotmail.com]() are not supported.**     

*NOTE: Currently this task will not work for the accounts having two factor authentication enabled, support will come soon.* 
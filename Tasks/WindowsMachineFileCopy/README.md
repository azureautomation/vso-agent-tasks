# Windows Machine File Copy Task
| S.NO | Target Machine State                                       | Target Machine trust with Automation agent | Machine Identity | Authentication Account                    | Authentication Mode | Authentication Account permission on Target Machine | Connection Type | Pre-requisites in Target machine for Copy Task to succeed                                                                                                                                                                                                                                                                                     | Pre-requisites in Target machine for Deployment Task to succeed                                                                                                                                                                                                                                                |
|------|------------------------------------------------------------|--------------------------------------------|------------------|-------------------------------------------|---------------------|-----------------------------------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1    | Domain joined machine in Corp network                      | Trusted                                    | DNS name         | Domain account                            | Kerberos            | Machine Administrator                               | WinRM HTTP      | WinRM HTTP port,(default 5985) opened in Firewall.,File & Printer sharing,enabled                                                                                                                                                                                                                                                             | WinRM HTTP port (default,5985) opened in Firewall.                                                                                                                                                                                                                                                             |
| 2    | Domain joined machine in Corp network                      | Trusted                                    | DNS name         | Domain account                            | Kerberos            | Machine Administrator                               | WinRM HTTPS     | WinRM HTTPS port,(default 5986) opened in Firewall.,Trusted certificate in,Automation agent,If Trusted certificate not in,Automation agent then SkipCA option enabled in Task for deployment.,File & Printer sharing,enabled                                                                                                                  | WinRM HTTPS port,(default 5986) opened in Firewall.,Trusted certificate in,Automation agent,If Trusted certificate not in,Automation agent then SkipCA option enabled in Task for deployment.                                                                                                                  |
| 3    | Domain joined machine,or Workgroup machine in Corp network | Any                                        | DNS name         | Local machine account                     | NTLM                | Machine Administrator                               | WinRM HTTP      | WinRM HTTP port (default,5985) opened in Firewall.,Disable UAC remote,restrictions(link),Credential in,\ format,Set,"AllowUnencrypted" option and add remote machines in "Trusted Host" list in Automation Agent (link),File & Printer sharing,enabled                                                                                        | WinRM HTTP port (default,5985) opened in Firewall.,Disable UAC remote,restrictions(link),Credential in,\ format,Set,"AllowUnencrypted" option and add remote machines in "Trusted Host" list in Automation Agent (link)                                                                                        |
| 4    | Domain joined machine or Workgroup machine,in Corp network | Any                                        | DNS name         | Local machine account                     | NTLM                | Machine Administrator                               | WinRM HTTPS     | WinRM HTTPS port,(default 5986) opened in Firewall.,Disable UAC remote,restrictions(link),Credential in,\ format,Trusted certificate in,Automation agent,If Trusted certificate not in,Automation agent then SkipCA option enabled in Task for deployment.,File & Printer sharing,enabled                                                     | WinRM HTTPS port,(default 5986) opened in Firewall.,Disable UAC remote,restrictions(link),Credential in,\ format,Trusted certificate in,Automation agent,If Trusted certificate not in,Automation agent then SkipCA option enabled in Task for deployment.                                                     |
| 5    | Workgroup machine in Azure                                 | Un Trusted                                 | DNS name         | Local machine account or MAS/Live account | NTLM                | Machine Administrator                               | WinRM HTTP      | WinRM HTTP port (default,5985) opened in Firewall.,Disable UAC remote,restrictions(link),Credential in,\ format,Set,"AllowUnencrypted" option and add remote machines in "Trusted Host" list in Automation Agent (link)                                                                                                                       | WinRM HTTP port (default,5985) opened in Firewall.,Disable UAC remote,restrictions(link),Credential in,\ format,Set,"AllowUnencrypted" option and add remote machines in "Trusted Host" list in Automation Agent (link)                                                                                        |
| 6    | Workgroup machine in Azure                                 | Un Trusted                                 | DNS name         | Local machine account or MAS/Live account | NTLM                | Machine Administrator                               | WinRM HTTPS     | WinRM HTTPS port,(default 5986) opened in Firewall.,Disable UAC remote,restrictions(link),Credential in,\ format,Trusted certificate in,Automation agent,If Trusted certificate not in,Automation agent then SkipCA option enabled in Task for deployment.                                                                                    | WinRM HTTPS port,(default 5986) opened in Firewall.,Disable UAC remote,restrictions(link),Credential in,\ format,Trusted certificate in,Automation agent,If Trusted certificate not in,Automation agent then SkipCA option enabled in Task for deployment.                                                     |
| 7    | Any                                                        | Any                                        | IP address       | Any                                       | NTLM                | Machine Administrator                               | WinRM HTTP      | WinRM HTTP port (default,5985) opened in Firewall.,Disable UAC remote,restrictions(link) in case of Local Machine,Administrator account,Credential in,\ or \,format,Set,"AllowUnencrypted" option and add remote machines in "Trusted Host" list in Automation Agent (link),File & Printer sharing,enabled                                    | WinRM HTTP port (default,5985) opened in Firewall.,Disable UAC remote,restrictions(link) in case of Local Machine,Administrator account,Credential in,\ or \,format,Set,"AllowUnencrypted" option and add remote machines in "Trusted Host" list in Automation Agent (link)                                    |
| 8    | Any                                                        | Any                                        | IP address       | Any                                       | NTLM                | Machine Administrator                               | WinRM HTTPS     | WinRM HTTPS port,(default 5986) opened in Firewall.,Disable UAC remote,restrictions(link) in case of Local Machine,Administrator account,Credential in,\ or \,format,Trusted certificate in,Automation agent,If Trusted certificate not in,Automation agent then SkipCA option enabled in Task for deployment.,File & Printer sharing,enabled | WinRM HTTPS port,(default 5986) opened in Firewall.,Disable UAC remote,restrictions(link) in case of Local Machine,Administrator account,Credential in,\ or \,format,Trusted certificate in,Automation agent,If Trusted certificate not in,Automation agent then SkipCA option enabled in Task for deployment. |
| 9    | AADjoined machine in Azure                                 | Un Trusted                                 | DNS name         | AAD account                               |                     | Machine Administrator                               | WinRM HTTP      |                                                                                                                                                                                                                                                                                                                                               | WinRM port 5985 (Firewall,opened, NTLM authentication enabled(winrm qc will do all this),Add remote computers to,"Trusted Host",Disable,UAC remote restrictions(link)                                                                                                                                          |
| 10   | AAD joined machine in Azure                                | Un Trusted                                 | DNS name         | AAD account                               |                     | Machine Administrator                               | WinRM HTTPS     |                                                                                                                                                                                                                                                                                                                                               |                                                                                                                                                                                                                                                                                                                |

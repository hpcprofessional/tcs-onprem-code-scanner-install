# tcs-onprem-code-scanner-install
Helpful scripts for those who want to get started using the Tenable.cs On-premise Code Scanner

This is only useful if you have access to *[Tenable Cloud Security](https://www.tenable.com/products/tenable-cs)*.
See also the [Use an On-Premise Code Scanner](https://docs.tenable.com/tenablecs/Content/Administration/Integrations/OnPremisesCodeScanner/On-premises-Bot.htm) portion of the Tenable Documentation.

## Overview

The Tenable.cs OnPrem Code Scanner is useful if you have an on-prem (not SaaS) Git-based VCS tool containing Infrastructure as Code you wish to scan with Tenable.cs.

## Expected Process

1. Spin up a new Ubuntu VM (at time of writing, 22.04 is recommended)
2. On that VM, create a working directory in your filesystem (for example /tenable.cs). Everything will be copied to or run from that directory.
3. From the Tenable Cloud Security Integrations page, download the OnPrem Code Scanner Zip file and put it in your working directory
4. Clone (or otherwise copy) this repository to your working directory
5. Run `sudo ./install.sh` to kick off the process. (It will install ansible, and call the playbook)
6. `ansible-playbook` will run to install prequisites, extract the zipfile, etc.
7. When finished with the playbook, you should run `sudo ./tenable-cs-code-scanner`
8. When the `tenable-cs-code-scanner` script has completed, you can point a browser to your VM, HTTP protocol, port 9020.

## Troubleshooting

1. In some cases, the port may not be open as expected. You might try port 9020. 
2. If nether the suggested port nor 9020 works, either of these two methods should show you the open ports on your Ubuntu VM

    * `sudo ss -tulpn`
    * `sudo netstat -tulpn`

# Apache Guacamole

Apache Guacamole is a clientless remote desktop gateway. It supports standard protocols like SSC, Telnet, VNC, and RDP. It is open source and requires no plugins or client software installed. Thanks to HTML5, once Guacamole is installed on a server, all you need to access your remote desktops and servers is a web browser.

Since Guacamole is accessed via your web browser, you can install Guacamole on a Cloud Service Provider (e.g. Microsoft, Amazon, or Google) and access Guacamole through your corporate proxy server. This can enable you to remotely access your Cloud hosted virtual machines without having to configure Firewall Rules or establish a Virtual Private Network.

## Getting Started

* Have or create your SSH Public Key
* Have or create an Azure Resource Group
* Have or create an Azure Virtual Network in the resource group above
* Deploy to Azure

### Prerequisites
In order to deploy this Azure Resource Manager template you will need provide the following parameters.

| Parameter                 | Description  |
| :-------------------------|:-------------|
| **Name**                   | Name of your Apache Guacamole Virtual Machine. |
| **DNS Prefix**             | DNS prefix for the assigned the Public IP address. |
| **Size**                   | Compute instance size (e.g. Standard_A2_v2). |
| **Username**               | Apache Guacamole Virtual Machine Administrator username.|
| **SSH Public Key**         | SSH Public Key that will be used for SSH authentication.|
| **Vnet Name**              | Name of an existing Virtual Network.|
| **Vnet RG**                | Name of the Resource Group where your Virtual Network resides.|
| **Subnet Name**            | Name of an existing Subnet within your Virtual Network.|
| **Cert Email Address**     | Email address to be used with the generation of your Let's Encrypt SSL certificate.|

### Generate your SSH Public Key

The SSH protocol supports many authentication methods. Arguably one of the most important of these is public key authentication for ineractive and automated connections. As such, this Azure Resource Manager template requires the use of SSH public key authentication. In order to generate a Public and Private key, you can use a tool called PuTTYgen (Windows) or ssh-keygen (Linux).

References
* <a href="https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-windows">Create and use SSH keys on Windows</a>
* <a href="https://docs.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys">Create and use SSH keys on Linux or macOS</a>

### Create an Azure Virtual Network

Most of you should already have an Azure Virtual Network with multiple subnets. However, if this is not the case, you can follow the references below to create an Azure Virtual Network.

```
Reminder: You will need to remember the Resource Group that your Virtual Network resides within.
```
References
* <a href="https://docs.microsoft.com/en-us/azure/virtual-network/quick-create-portal">Create a virtual network using the Azure portal</a>
* <a href="https://docs.microsoft.com/en-ca/azure/virtual-network/quick-create-powershell">Create a virtual network using PowerShell</a>

### Deploy to Azure

Once you have the answers to each of the rerequisites, you are ready to proceed with deploying this Azure Resource Manager template by clicking the **Deploy to Azure** button below.

The following will occur as part of the deployment to Microsoft Azure:
* Creation of a Ubuntu 16.04 virtual machine
* Creation of a Public IP address with your specified DNS prefix
* Creation of a Network Security Group that allows incoming traffic on ports 22, 80, 443.
  * Ports 8080 and 8443 are proxied via the Nginx server to Node thus they are not required to be open.
* Installation of Nginx, Node, Guacamole-Server, and a Let's Encrypt SSL certificate

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Frealholgi%2Fguacamole%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>



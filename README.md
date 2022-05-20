![SoftEther VPN](https://img.icons8.com/color/480/softether-vpn.png)

# SoftEther VPN installer script

With this script, you can set up your own SoftEther VPN on an **Ubuntu/Debian** based server. Get your dedicated VPN up and running in just 2-3 minutes. We strongly recommend using your own VPN server to ensure maximum security & complete privacy at all times.

A few things worth mentioning for this script:
 - You get a ready-to-use SoftEther VPN;
 - All VPN logs will be disabled by default;
 - SoftEther VPN software version that will be installed: **v4.38-9760-rtm-2021.08.17** (we will try to update the version regularly);
 - The software works for Ubuntu/Debian based servers;
 - Works great on an OpenVZ 7 container.

 ## What is SoftEther?
 SoftEther is a completely open-source, multi-protocol VPN software, which is a great option for privacy-seeking people. You can read more about the software on the [official SoftEther website](https://www.softether.org/).

 ## Installation
Download the script, make it executable and run it using the following commands:
 ```bash
wget https://raw.githubusercontent.com/vpsbg/softether-vpn-installer/master/softether-install.sh
chmod +x softether-install.sh
./softether-install.sh
```
No user input is required.

## Why hosting your own VPN server is the best option than using the popular VPN providers?
You have complete control over the VPN including installation, its settings, management and the log policy. Many popular VPN providers state that they utilize a "no logs policy", but that is not always the case. Having your own VPN server means that you can manually and personally verify that no logs are being recorded, stored or utilized. We have shared our opinion on this topic in [one of our blog posts](https://www.vpsbg.eu/blog/vpn-on-vps-is-better-than-vpn-service), where we have also illustrated some of the other advantages of having your own VPN server.

## How to connect to the VPN? How can I manage my SoftEther VPN instance? 
SoftEther VPN Client URL: [Download](https://www.softether-download.com/en.aspx?product=softether)

After our script has been executed successfully, the login credentials will be printed. Use [this guide](https://www.vpsbg.eu/docs/how-to-connect-desktop-softether-dedicated-vpn-server) and the credentials from your terminal to connect to the VPN. And you can read [this post](https://www.vpsbg.eu/docs/how-to-manage-your-dedicated-softether-vpn-server) to see how you can manage your VPN using the SoftEther Management software.

## I am looking for a VPS/server where I can host my VPN. Any recommendations?
You can take a look at our servers (located in Sofia, Bulgaria): [KVM-based VPS](https://www.vpsbg.eu/kvm-vps) or [OpenVZ VPS](https://www.vpsbg.eu/ssd-vps). VPSBG also offers [Dedicated VPN](https://www.vpsbg.eu/dedicated-vpn-servers) service, which includes deploying a new VPS for every customer. The VPN software is then installed on that server using the open-source scripts that have been manually written by us.

## License
[More information](https://raw.githubusercontent.com/vpsbg/softether-vpn-installer/master/LICENSE) about the MIT license.


# SoftEther VPN installer script

With this script, you can set up your own SoftEther VPN on **Ubuntu/Debian** based server. Have your own dedicated VPN in just 2-3 minutes. We strongly recommend you always use your own VPN servers for maximum security & privacy.

A few things worth mentioning for this script:
 - You receive a ready-to-use SoftEther VPN;
 - All VPN logs will be disabled by default;
 - SoftEther VPN software version that will be installed: **v4.38-9760-rtm-2021.08.17** (we will try to update the version regularly);
 - The software works for Ubuntu/Debian based servers;
 - Works great on an OpenVZ 7 container.

 ## What is SoftEther?
 SoftEther is a multi-protocol VPN software that is completely open-source - a great option for privacy-seeking people. You can read more on the [official SoftEther website](https://www.softether.org/).

 ## Installation
 Download the script, make it executable and run it:
 ```bash
wget https://raw.githubusercontent.com/vpsbg/softether-vpn-installer/master/softether-install.sh
chmod +x softether-install.sh
./softether-install.sh
```
No user input is required.

## Why hosting your own VPN server is the best option than using the popular VPN providers?
You have complete control over the VPN - how it is installed, how it works and what is the logging policy. Many popular VPN providers state that they have applied "no logs policy" but having your own VPN server you can actually verify that. We have our opinion shared on this topic which you can read in [one of our blog posts](https://www.vpsbg.eu/blog/vpn-on-vps-is-better-than-vpn-service).

## How to connect to the VPN? How can I manage my SoftEther VPN instance? 
SoftEther VPN Client URL: [Download](https://www.softether-download.com/en.aspx?product=softether)

After a successful run of our script, the credentials will be printed. Use [this guide](https://www.vpsbg.eu/docs/how-to-connect-desktop-softether-dedicated-vpn-server) and the credentials from your terminal to connect to the VPN.
And you can read [this post](https://www.vpsbg.eu/docs/how-to-manage-your-dedicated-softether-vpn-server) to see how you can manage your VPN using the SoftEther Management software.

## I am looking for a VPS/server where I can host my VPN. Any recommendations?
You can take a look at our servers (located in Sofia, Bulgaria): [KVM-based VPS](https://www.vpsbg.eu/kvm-vps) or [OpenVZ VPS](https://www.vpsbg.eu/ssd-vps). VPSBG also offers [Dedicated VPN](https://www.vpsbg.eu/dedicated-vpn-servers) service where a new VPS is deployed for each customer and the VPN is being installed with open source scripts, written by us.

## License
[More information](https://raw.githubusercontent.com/vpsbg/softether-vpn-installer/master/LICENSE) about the MIT license.


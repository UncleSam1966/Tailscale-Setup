# Tailscale-Setup
A simple script to install Tailscale on Technicolor & GL.iNet routers (Tested on Technicolour DJA0230, DJA0231, CobraXh and GL.iNet Mango GL-MT300N-V2)

The need for me came about when I discovered my parent's device was behind a CG-NAT and was therefore unable to remotely access their network for unattended troubleshooting puroses.

Thanks to [Will Angley's](https://willangley.org/how-i-set-up-tailscale-on-my-wifi-router/) post and [ItsAllTooMuch4Me](https://github.com/seud0nym/tch-gui-unhide) for his excelllent work on the tch-gui-unhide and other utilities, I was able to convert Will's very helpful blog to a set of scripts to automate the install, update, regress and removal of the Tailscale application on the Technicolour routers.

## Firmware Applicability (Technicolor)

For firmware 20.3.c. and above only.

Other firmware may not been compiled with TUN support in the kernel, and therefore VPN tunnels cannot be created. To check if your firmware does have TUN support run ```zcat /proc/config.gz | grep CONFIG_TUN``` and if it returns ```CONFIG_TUN=y``` then you can potentially install Tailscale.

## Prerequisites (Technicolor)

Install / update System CA Certificates either manually:

    opkg update
    opkg install ca-certificates ca-bundle

Or by downloading and running the [update-ca-certificates](https://github.com/seud0nym/tch-gui-unhide/tree/master/utilities#update-ca-certificates) script which will install the latest available certificates (and gives you the option to schedule a regular job to update them), whereas the opkg packages may not contain the latest certificates.

## Installation of Tailscale

Execute this command on your device via a PuTTY session or equivalent (an active WAN/Internet connection is required):
```
curl -skLo tailscale-setup https://github.com/UncleSam1966/tch-tailscale/releases/latest/download/tailscale-setup  && chmod +x tailscale-setup && ./tailscale-setup
```

Alternatively, download the script manually and load it up to your device using WinSCP or equivalent.

After you have the script on your device, you may need to make it executable, which is done with this command (assuming you are in the same directory as the script):
```
chmod +x tailscale-setup
```

Then, execute the script (assuming you are in the same directory into which you downloaded or uploaded the script):
```
./tailscale-setup
```

At the end of the install you will be prompted to visit a link presented by the tailscale application to authorise the device in your tailscale [admin console](https://login.tailscale.com/admin/machines).

Once approved, you can also choose to permit subnet access. ***Note:** When the device is replaced or sold, remember to remove it from the Tailscale Machines portal.*

## NEW - Extra GUI Script for Technicolor Routers - ```tch-gui-unhide-xtra.tailscale```

## Firmware Applicability
Should be applicable to all firmware versions supported by ```tch-gui-unhide```.

## Prerequisites
Make sure you are in the directory in which the ```tch-gui-unhide``` script in installed, and then execute the above ```tailscale-setup``` commands to install the latest tailscale-setup package and configuration.

## Installation
    curl -skLO https://github.com/UncleSam1966/tch-tailscale/releases/latest/download/tch-gui-unhide-xtra.tailscale && ./tch-gui-unhide -y

## Removal Instructions
Remove the Tailscale instalation with ```tailscale-setup -yu```
Delete ```tch-gui-unhide-xtra.tailscale```
Re-run ```tch-gui-unhide``` to remove the GUI changes, and the additional transformer mappings

Happy Tunneling!

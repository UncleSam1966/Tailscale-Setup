# tch-tailscale
A tutorial to install Tailscale on Technicolour routers (Tested on Technicolour DJA0231)

The need for me came about when I discovered my parent's device was behind a CG-NAT and was therefore unable to remotely access their network for unattended troubleshooting puroses.

Thanks to [Will Angley's](https://willangley.org/how-i-set-up-tailscale-on-my-wifi-router/) post and [ItsAllTooMuch4Me](https://github.com/seud0nym/tch-gui-unhide) for his excelllent work on the tch-gui-unhide and other utilities, I was able to convert Will's very helpful blog to a set of scripts to automate the install, update and removal of the Tailscale application on the Technicolour routers. I've currently only tested this on the DJA0231 successfully.

## Firmware Applicability

For firmware 20.3.c. only.

Other firmware may not been compiled with TUN support in the kernel, and therefore VPN tunnels cannot be created. To check if your firmware does have TUN support run ```zcat /proc/config.gz | grep CONFIG_TUN``` and if it returns ```CONFIG_TUN=y``` then you can potentially install Tailscale.

## Prerequisites

Install / update System CA Certificates either manually:

    opkg update
    opkg install ca-certificates ca-bundle

Or by downloading and running the [update-ca-certificates](https://github.com/seud0nym/tch-gui-unhide/tree/master/utilities#update-ca-certificates) script which will install the latest available certificates (and gives you the option to schedule a regular job to update them), whereas the opkg packages may not contain the latest certificates.

## Installation of TailScale

Just download the three scripts onto the /root directory of the Technicolour device and run the ```tailscale-install``` script. You will be prompted for a device alias that will show up in your tailscale machines portal.

Or you could just do it all in one go:

    sh -c "'./'$(curl -skL https://raw.githubusercontent.com/UncleSam1966/tch-tailscale/master/tch-tailscale.tar.gz | tar -xzvf -)"

At the end of the install you will be prompted to visit a link presented by the tailscale application to authorise the device in your tailscale [admin console](https://login.tailscale.com/admin/machines).

Once approved, you can also choose to permit subnet access.

Happy Tunneling!

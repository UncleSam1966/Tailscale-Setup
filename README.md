# tch-tailscale
A tutorial to install Tailscale on Technicolour routers (Tested on Technicolour DJA0231)

The need for me came about when I discovered my parent's device was behind a CG-NAT and was therefore unable to remotely access their network for unattended troubleshooting puroses.

Thanks to [Will Angley's](https://willangley.org/how-i-set-up-tailscale-on-my-wifi-router/) post and [ItsAllTooMuch4Me](https://github.com/seud0nym/tch-gui-unhide) for his excelllent work on the tch-gui-unhide and other utilities, I was able to convert Will's very helpful blog to a set of scripts to automate the install, update and removal of the Tailscale application on the Technicolour routers. I've currently only tested this on the DJA0231 successfully.

There are a couple of prerequisites which I've assumed are already installed, these are ca-bundle and kmod-tun. If they're not installed, they can be installed thusly:

    opkg update
    opkg install ca-bundle kmod-tun

Thereafter, just download the three scripts onto the root directory of the Technicolour device and run the install script. You will be prompted for a device alias that will chow up in your tailscale machines portal.

At the end of the install you will be prompted to visit a link presented by the tailscale application to authorise the device in your tailscale [admin console](https://login.tailscale.com/admin/machines).

Once approved, you can also choose to permit subnet access.

Happy Tunneling!

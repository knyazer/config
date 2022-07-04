# Knyaz config
*This is a collection of scripts, which I usually use to setup a new system*

## Quickstart
In ```config.sh``` you **MUST** replace the variables with your respective username, real name and email.  Former one used to configure pathes, two latter used only for git. Besides that, in the end of installation, you will be prompted to save the Wireguard VPN key in a particular folder, for the automatic vpn activation on startup. I use xeovo, so all the vpn names are using their vpn servers names. You might want to change all appeareances of the ```xeovo-nl``` in ```ubuntu_vpn_setup.sh``` to the name of the file with your key. I followed the guide [here](https://xeovo.com/guides/) for the x64 linux with wireguard. 

Then you can configure the system:
```
sudo bash ubuntu_setup.sh
bash ubuntu_zsh_install.sh
```
or, if you do not like zsh, you could run only general setup script
```
sudo bash ubuntu_setup.sh
```
This definetely works for Ubuntu 22.04, though supposedly should work for almost any debian-based distro.
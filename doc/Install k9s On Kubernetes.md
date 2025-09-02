# Install k9s On Kubernetes

## Procedure
```
$ curl -sS https://webinstall.dev/k9s | bash

>>> Welcome to Webi! - modern tools, instant installs.  <<<
    We expect your experience to be absolutely perfect!

    Success? Star it!   https://github.com/webinstall/webi-installers
    Problem? Report it: https://github.com/webinstall/webi-installers/issues
                        (your system is GNU/Linux/x86_64 with libc & curl+wget)

Bootstrapping Webi
    Downloading https://webinstall.dev/packages/webi/webi.sh
        to ~/.local/bin/webi
    Running ~/.local/bin/webi k9s@stable

Installing k9s ...
    Found  ~/.local/bin
    Initializing ~/.config/envman/
    Edit ~/.profile to source ~/.config/envman/load.sh
    Edit ~/.bashrc to source ~/.config/envman/load.sh
    Downloading k9s from
      https://github.com/derailed/k9s/releases/download/v0.50.9/k9s_Linux_amd64.tar.gz
    Saved as ~/Downloads/webi/k9s/0.50.9/k9s_Linux_amd64.tar.gz
    Extracting ~/Downloads/webi/k9s/0.50.9/k9s_Linux_amd64.tar.gz
    Installing to ~/.local/opt/k9s-v0.50.9/bin/k9s

    Installed 'k9s v0.50.9' as ~/.local/bin/k9s

    Edit ~/.config/envman/PATH.env to add:
        ~/.local/bin

>>> ACTION REQUIRED <<<
        Copy, paste & run the following command:
        source ~/.config/envman/PATH.env
        (newly opened terminal windows will update automatically)
```
## Interface
<img width="2821" height="1240" alt="image" src="https://github.com/user-attachments/assets/a3757fd2-6384-40a7-840c-805acce671d2" />


## Reference
- [How to Master K9s for Kubernetes Development](https://medium.com/@karthidkk123/how-to-master-k9s-for-kubernetes-development-6655adf06788) | Medium


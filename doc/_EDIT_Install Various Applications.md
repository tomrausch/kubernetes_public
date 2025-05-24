------
## kubeshark


https://github.com/kubeshark/kubeshark/blob/master/README.md


tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:~$ helm repo add kubeshark https://helm.kubeshark.co
"kubeshark" has been added to your repositories

tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:~$ helm install kubeshark kubeshark/kubeshark
NAME: kubeshark
LAST DEPLOYED: Sat May 24 08:58:13 2025
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Thank you for installing Kubeshark.

Registry: docker.io/kubeshark
Tag: v52.7

Your deployment has been successful. The release is named `kubeshark` and it has been deployed in the `default` namespace.

Notices:
- No license key was detected. You can either log-in/sign-up through the dashboard, or download the license key from https://console.kubeshark.co/.


To access the application, follow these steps:

1. Perform port forwarding with the following commands:

    kubectl port-forward -n default service/kubeshark-front 8899:80

2. Once port forwarding is done, you can access the application by visiting the following URL in your web browser:
    http://0.0.0.0:8899/

------


## krew
```
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:~$ set -x; cd "$(mktemp -d)" && OS="$(uname | tr '[:upper:]' '[:lower:]')" && ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" && KREW="krew-${OS}_${ARCH}" && curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" && tar zxvf "${KREW}.tar.gz" && ./"${KREW}" install krew
++ mktemp -d
+ cd /tmp/tmp.HalWwx9peM
++ uname
++ tr '[:upper:]' '[:lower:]'
+ OS=linux
++ uname -m
++ sed -e s/x86_64/amd64/ -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/'
+ ARCH=amd64
+ KREW=krew-linux_amd64
+ curl -fsSLO https://github.com/kubernetes-sigs/krew/releases/latest/download/krew-linux_amd64.tar.gz
+ tar zxvf krew-linux_amd64.tar.gz
./._LICENSE
tar: Ignoring unknown extended header keyword 'LIBARCHIVE.xattr.com.apple.provenance'
./LICENSE
./._krew-linux_amd64
tar: Ignoring unknown extended header keyword 'LIBARCHIVE.xattr.com.apple.provenance'
./krew-linux_amd64
+ ./krew-linux_amd64 install krew
Adding "default" plugin index from https://github.com/kubernetes-sigs/krew-index.git.
Updated the local copy of plugin index.
Installing plugin: krew
Installed plugin: krew
\
 | Use this plugin:
 |      kubectl krew
 | Documentation:
 |      https://krew.sigs.k8s.io/
 | Caveats:
 | \
 |  | krew is now installed! To start using kubectl plugins, you need to add
 |  | krew's installation directory to your PATH:
 |  |
 |  |   * macOS/Linux:
 |  |     - Add the following to your ~/.bashrc or ~/.zshrc:
 |  |         export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
 |  |     - Restart your shell.
 |  |
 |  |   * Windows: Add %USERPROFILE%\.krew\bin to your PATH environment variable
 |  |
 |  | To list krew commands and to get help, run:
 |  |   $ kubectl krew
 |  | For a full list of available plugins, run:
 |  |   $ kubectl krew search
 |  |
 |  | You can find documentation at
 |  |   https://krew.sigs.k8s.io/docs/user-guide/quickstart/.
 | /
/
```

```
 set -x; cd "$(mktemp -d)" && OS="$(uname | tr '[:upper:]' '[:lower:]')" && ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" && KREW="krew-${OS}_${ARCH}" && curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" && tar zxvf "${KREW}.tar.gz" && ./"${KREW}" install krew
```

```
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:/tmp/tmp.HalWwx9peM$ export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
+ export PATH=/home/tomrausch/.krew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
+ PATH=/home/tomrausch/.krew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

```
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:/tmp/tmp.HalWwx9peM$  kubectl krew
+ kubectl krew
krew is the kubectl plugin manager.
You can invoke krew through kubectl: "kubectl krew [command]..."

Usage:
  kubectl krew [command]

Available Commands:
  help        Help about any command
  index       Manage custom plugin indexes
  info        Show information about an available plugin
  install     Install kubectl plugins
  list        List installed kubectl plugins
  search      Discover kubectl plugins
  uninstall   Uninstall plugins
  update      Update the local copy of the plugin index
  upgrade     Upgrade installed plugins to newer versions
  version     Show krew version and diagnostics

Flags:
  -h, --help      help for krew
  -v, --v Level   number for the log level verbosity

Use "kubectl krew [command] --help" for more information about a command.
```

https://krew.sigs.k8s.io/docs/user-guide/setup/install/

----
## kubectl-tree

```
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:/tmp/tmp.HalWwx9peM$ kubectl krew install tree
+ kubectl krew install tree
Updated the local copy of plugin index.
Installing plugin: tree
Installed plugin: tree
\
 | Use this plugin:
 |      kubectl tree
 | Documentation:
 |      https://github.com/ahmetb/kubectl-tree
 | Caveats:
 | \
 |  | * For resources that are not in default namespace, currently you must
 |  |   specify -n/--namespace explicitly (the current namespace setting is not
 |  |   yet used).
 | /
/
WARNING: You installed plugin "tree" from the krew-index plugin repository.
   These plugins are not audited for security by the Krew m
```

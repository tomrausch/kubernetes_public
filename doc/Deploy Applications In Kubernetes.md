# Deploy Applications In Kubernetes

--------

## ☁️ Deploy A Standard Application

Run the command "Command - Create Deployment" in Table 1 below and observe the result to deploy an image and create the Deployment
```bash
$ kubectl create deployment it-tools --image=corentinth/it-tools:latest
deployment.apps/it-tools created
```

Run the command "Command - Expose Service" in the table below and observe the result to expose the Deployment
```bash
$ kubectl expose deployment it-tools --type=LoadBalancer --port=8080
service/it-tools exposed
```

Perform the checks in [Confirm The Deployment And Service](https://github.com/tomrausch/kubernetes_public/blob/9569089708b8f66adc3a30add0f74f5c53544dd3/doc/Confirm%20The%20Deployment%20And%20Service.md) for Service "service/kuard"


#### Table 1

| Name | Command - Create Deployment | Command - Expose Service | Additional Steps | Reference |
| :---: | :--- | :--- | :---  | :---: |
| hello-blue-whale | ```kubectl create deployment hello-blue-whale --image=vamsijakkula/hello-blue-whale:v1``` | ```kubectl expose deployment hello-blue-whale --type=NodePort --port=80``` | None | [vamsijakkula](https://gist.github.com/vamsijakkula)|
| hello-minikube | ```kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0``` | ```kubectl expose deployment hello-minikube --type=NodePort --port=8080``` | Yes - Below | [minikube start - Deploy Applications - Service](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download#Service) |
| it-tools | ```kubectl create deployment it-tools --image=corentinth/it-tools:latest``` | ```kubectl expose deployment it-tools --type=NodePort --port=80``` | None | [CorentinTh/it-tools](https://github.com/CorentinTh/it-tools)
| kuard | ```kubectl create deployment kuard --image=gcr.io/kuar-demo/kuard-amd64:blue``` | ```kubectl expose deployment kuard --type=NodePort --port=8080``` | None | [kuard](https://github.com/kubernetes-up-and-running/kuard) |
| web | ```kubectl create deployment web gcr.io/google-samples/hello-app:1.0``` | ```kubectl expose deployment web --type=NodePort --port=8080``` | None | [web](https://console.cloud.google.com/artifacts/docker/google-samples/us/gcr.io/hello-app?inv=1&invt=AbxY8g) |


#### Additional Steps "hello-minikube"
Form the YAML file [minikube-test-application.Pod-Service.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml)
- This YAML file contains the Pods and Services for the application
- Reference: [minikube start - Ingress](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download#Ingress)

Run the command ```kubectl apply -f --image=https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml``` and observe the results. This creates Pods and Services.

```
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml
pod/foo-app created
service/foo-service created
pod/bar-app created
service/bar-service created
```

Access the application "foo" in a browser at the offset URL ".../foo"

```
Request served by foo-app

HTTP/1.1 GET /foo

Host: 34.8.144.4
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
Connection: Keep-Alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36
Via: 1.1 google
X-Cloud-Trace-Context: c3f9dcbc270c5fcc4b8fd6fc57ec3449/8716341095219747881
X-Forwarded-For: 98.253.161.202, 34.8.144.4
X-Forwarded-Proto: http
```

Access the application "bar" in a browser at the offset URL ".../bar"

```
Request served by bar-app

HTTP/1.1 GET /bar

Host: 34.8.144.4
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
Connection: Keep-Alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36
Via: 1.1 google
X-Cloud-Trace-Context: 4533c4d181e326dc16d6d77b7028eec4/12160296242366395395
X-Forwarded-For: 98.253.161.202, 34.8.144.4
X-Forwarded-Proto: http
```


## 💿 Deploy A MySQL Database

Ready these YAML files
- [mysql_01_Secret.yaml](https://github.com/tomrausch/kubernetes_public/blob/cb4288547a853fdc88f80f15945ddf9904f54e8c/src/mysql/mysql_01_Secret.yaml)
- [mysql_02_Storage.yaml](https://github.com/tomrausch/kubernetes_public/blob/cb4288547a853fdc88f80f15945ddf9904f54e8c/src/mysql/mysql_02_Storage.yaml)
- [mysql_03_Deployment.yaml](https://github.com/tomrausch/kubernetes_public/blob/cb4288547a853fdc88f80f15945ddf9904f54e8c/src/mysql/mysql_03_Deployment.yaml)
- [mysql_04_ConfigMap.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/mysql/mysql_04_ConfigMap.yaml)

Run the command ```kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_01_Secret.yaml``` to deploy the Secret
```bash
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_01_Secret.yaml
secret/mysql-secret configured
```

Check the Secret (in GUI)

Run the command ```kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_02_Storage.yaml``` to deploy the PersistentVolume and the PersistentVolumeClaim
```
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_02_Storage.yaml
persistentvolume/mysql-pv-volume created
persistentvolumeclaim/mysql-pv-claim created
```

Check the PersistentVolume and the PersistentVolumeClaim (in GUI)

Run the command ```kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_03_ConfigMap.yaml``` to deploy the ConfigMap
```
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_03_ConfigMap.yaml
configmap/tcp-services created
```

Check the ConfigMap (in GUI)

Run the command ```kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_04_Deployment.yaml``` to deploy the Deployment and the Service
```
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_04_Deployment.yaml
Warning: autopilot-default-resources-mutator:Autopilot updated Deployment default/mysql: defaulted unspecified 'cpu' resource for containers [mysql] (see http://g.co/gke/autopilot-defaults).
deployment.apps/mysql created
service/mysql created
```

Check the Deployment and the Service (in GUI)

Run mysql And List The Databases
```
kubectl exec --stdin --tty pod/mysql-deploy-7bc6bb6cc6-r689s -- /bin/bash

mysql -p #enter the password defined in the secret configuration
```


```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| book-management-db |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)
```

```
  -f, --force         Continue even if we get an SQL error.
  --histignore=name   A colon-separated list of patterns to keep statements
                      from getting logged into syslog and mysql history.
  -G, --named-commands 
                      Enable named commands. Named commands mean this program's
                      internal commands; see mysql> help . When enabled, the
                      named commands can be used from any line of the query,
                      otherwise only from the first line, before an enter.
                      Disable with --disable-named-commands. This option is
                      disabled by default.
  -i, --ignore-spaces Ignore space after function names.
  --init-command=name Single SQL Command to execute when connecting to MySQL
                      server. Will automatically be re-executed when
                      reconnecting.
  --init-command-add=name 
                      Add SQL command to the list to execute when connecting to
                      MySQL server. Will automatically be re-executed when
                      reconnecting.
  --local-infile      Enable/disable LOAD DATA LOCAL INFILE.
  -b, --no-beep       Turn off beep on error.
  -h, --host=name     Connect to host.
  --dns-srv-name=name Connect to a DNS SRV resource
  -H, --html          Produce HTML output.
  -X, --xml           Produce XML output.
  --line-numbers      Write line numbers for errors.
                      (Defaults to on; use --skip-line-numbers to disable.)
  -L, --skip-line-numbers 
                      Don't write line number for errors.
  -n, --unbuffered    Flush buffer after each query.
  --column-names      Write column names in results.
                      (Defaults to on; use --skip-column-names to disable.)
  -N, --skip-column-names 
                      Don't write column names in results.
  --sigint-ignore     Ignore SIGINT (CTRL-C).
  -o, --one-database  Ignore statements except those that occur while the
                      default database is the one named at the command line.
  --pager[=name]      Pager to use to display results. If you don't supply an
                      option, the default pager is taken from your ENV variable
                      PAGER. Valid pagers are less, more, cat [> filename],
                      etc. See interactive help (\h) also. This option does not
                      work in batch mode. Disable with --disable-pager. This
                      option is disabled by default.
  -p, --password[=name] 
                      Password to use when connecting to server. If password is
                      not given it's asked from the tty.
  -,, --password1[=name] 
                      Password for first factor authentication plugin.
  -,, --password2[=name] 
                      Password for second factor authentication plugin.
  -,, --password3[=name] 
                      Password for third factor authentication plugin.
  -P, --port=#        Port number to use for connection or 0 for default to, in
                      order of preference, my.cnf, $MYSQL_TCP_PORT,
                      /etc/services, built-in default (3306).
  --prompt=name       Set the mysql prompt to this value.
  --protocol=name     The protocol to use for connection (tcp, socket, pipe,
                      memory).
  -q, --quick         Don't cache result, print it row by row. This may slow
                      down the server if the output is suspended. Doesn't use
                      history file.
  -r, --raw           Write fields without conversion. Used with --batch.
  --reconnect         Reconnect if the connection is lost. Disable with
                      --disable-reconnect. This option is enabled by default.
                      (Defaults to on; use --skip-reconnect to disable.)
  -s, --silent        Be more silent. Print results with a tab as separator,
                      each row on new line.
  -S, --socket=name   The socket file to use for connection.
  --server-public-key-path=name 
                      File path to the server public RSA key in PEM format.
  --get-server-public-key 
                      Get server public key
  --ssl-mode=name     SSL connection mode.
  --ssl-ca=name       CA file in PEM format.
  --ssl-capath=name   CA directory.
  --ssl-cert=name     X509 cert in PEM format.
  --ssl-cipher=name   SSL cipher to use.
  --ssl-key=name      X509 key in PEM format.
  --ssl-crl=name      Certificate revocation list.
  --ssl-crlpath=name  Certificate revocation list path.
  --tls-version=name  TLS version to use, permitted values are: TLSv1.2,
                      TLSv1.3
  --ssl-fips-mode=name 
                      SSL FIPS mode (applies only for OpenSSL); permitted
                      values are: OFF, ON, STRICT
  --tls-ciphersuites=name 
                      TLS v1.3 cipher to use.
  --ssl-session-data=name 
                      Session data file to use to enable ssl session reuse
  --ssl-session-data-continue-on-failed-reuse 
                      If set to ON, this option will allow connection to
                      succeed even if session data cannot be reused.
  --tls-sni-servername=name 
                      The SNI server name to pass to server
  -t, --table         Output in table format.
  --tee=name          Append everything into outfile. See interactive help (\h)
                      also. Does not work in batch mode. Disable with
                      --disable-tee. This option is disabled by default.
  -u, --user=name     User for login if not current user.
  -U, --safe-updates  Only allow UPDATE and DELETE that uses keys.
  -U, --i-am-a-dummy  Synonym for option --safe-updates, -U.
  -v, --verbose       Write more. (-v -v -v gives the table output format).
  -V, --version       Output version information and exit.
  -w, --wait          Wait and retry if connection is down.
  --connect-timeout=# Number of seconds before connection timeout.
  --max-allowed-packet=# 
                      The maximum packet length to send to or receive from
                      server.
  --net-buffer-length=# 
                      The buffer size for TCP/IP and socket communication.
  --select-limit=#    Automatic limit for SELECT when using --safe-updates.
  --max-join-size=#   Automatic limit for rows in a join when using
                      --safe-updates.
  --show-warnings     Show warnings after every statement.
  -j, --syslog        Log filtered interactive commands to syslog. Filtering of
                      commands depends on the patterns supplied via histignore
                      option besides the default patterns.
  --plugin-dir=name   Directory for client-side plugins.
  --default-auth=name Default authentication client-side plugin to use.
  --binary-mode       By default, ASCII '\0' is disallowed and '\r\n' is
                      translated to '\n'. This switch turns off both features,
                      and also turns off parsing of all clientcommands except
                      \C and DELIMITER, in non-interactive mode (for input
                      piped to mysql or loaded using the 'source' command).
                      This is necessary when processing output from mysqlbinlog
                      that may contain blobs.
  --connect-expired-password 
                      Notify the server that this client is prepared to handle
                      expired password sandbox mode.
  --network-namespace=name 
                      Network namespace to use for connection via tcp with a
                      server.
  --compression-algorithms=name 
                      Use compression algorithm in server/client protocol.
                      Valid values are any combination of
                      'zstd','zlib','uncompressed'.
  --zstd-compression-level=# 
                      Use this compression level in the client/server protocol,
                      in case --compression-algorithms=zstd. Valid range is
                      between 1 and 22, inclusive. Default is 3.
  --load-data-local-dir=name 
                      Directory path safe for LOAD DATA LOCAL INFILE to read
                      from.
  --authentication-oci-client-config-profile=name 
                      Specifies the configuration profile whose configuration
                      options are to be read from the OCI configuration file.
                      Default is DEFAULT.
  --oci-config-file=name 
                      Specifies the location of the OCI configuration file.
                      Default for Linux is ~/.oci/config and %HOME/.oci/config
                      on Windows.
  --authentication-openid-connect-client-id-token-file=name 
                      Specifies the location of the ID token file.
  --telemetry-client  Load the telemetry_client plugin.
  --plugin-authentication-webauthn-client-preserve-privacy 
                      Allows selection of discoverable credential to be used
                      for signing challenge. default is false - implies
                      challenge is signed by all credentials for given relying
                      party.
  --plugin-authentication-webauthn-device=# 
                      Specifies what libfido2 device to use. 0 (the first
                      device) is the default.
  --register-factor=name 
                      Specifies factor for which registration needs to be done
                      for.
  --system-command    Enable or disable (by default) the 'system' mysql
                      command.

Default options are read from the following files in the given order:
/etc/my.cnf /etc/mysql/my.cnf /usr/etc/my.cnf ~/.my.cnf 
The following groups are read: mysql client
The following options may be given as the first argument:
--print-defaults        Print the program argument list and exit.
--no-defaults           Don't read default options from any option file,
                        except for login file.
--defaults-file=#       Only read default options from the given file #.
--defaults-extra-file=# Read this file after the global files are read.
--defaults-group-suffix=#
                        Also read groups with concat(group, suffix)
--login-path=#          Read this path from the login file.
--no-login-paths        Don't read login paths from the login path file.

Variables (--variable-name=value)
and boolean options {FALSE|TRUE}                       Value (after reading options)
------------------------------------------------------ -------------------
auto-rehash                                            TRUE
auto-vertical-output                                   FALSE
bind-address                                           (No default value)
binary-as-hex                                          FALSE
character-sets-dir                                     (No default value)
column-type-info                                       FALSE
comments                                               TRUE
compress                                               FALSE
database                                               (No default value)
default-character-set                                  auto
delimiter                                              ;
enable-cleartext-plugin                                FALSE
vertical                                               FALSE
force                                                  FALSE
histignore                                             (No default value)
named-commands                                         FALSE
ignore-spaces                                          FALSE
local-infile                                           FALSE
no-beep                                                FALSE
host                                                   (No default value)
dns-srv-name                                           (No default value)
html                                                   FALSE
xml                                                    FALSE
line-numbers                                           TRUE
unbuffered                                             FALSE
column-names                                           TRUE
sigint-ignore                                          FALSE
port                                                   0
prompt                                                 mysql> 
quick                                                  FALSE
raw                                                    FALSE
reconnect                                              FALSE
socket                                                 /var/run/mysqld/mysqld.sock
server-public-key-path                                 (No default value)
get-server-public-key                                  FALSE
ssl-ca                                                 (No default value)
ssl-capath                                             (No default value)
ssl-cert                                               (No default value)
ssl-cipher                                             (No default value)
ssl-key                                                (No default value)
ssl-crl                                                (No default value)
ssl-crlpath                                            (No default value)
tls-version                                            (No default value)
tls-ciphersuites                                       (No default value)
ssl-session-data                                       (No default value)
ssl-session-data-continue-on-failed-reuse              FALSE
tls-sni-servername                                     (No default value)
table                                                  FALSE
user                                                   (No default value)
safe-updates                                           FALSE
i-am-a-dummy                                           FALSE
wait                                                   FALSE
connect-timeout                                        0
max-allowed-packet                                     16777216
net-buffer-length                                      16384
select-limit                                           1000
max-join-size                                          1000000
show-warnings                                          FALSE
plugin-dir                                             (No default value)
default-auth                                           (No default value)
binary-mode                                            FALSE
connect-expired-password                               FALSE
network-namespace                                      (No default value)
compression-algorithms                                 (No default value)
zstd-compression-level                                 3
load-data-local-dir                                    (No default value)
authentication-oci-client-config-profile               (No default value)
oci-config-file                                        (No default value)
authentication-openid-connect-client-id-token-file     (No default value)
telemetry-client                                       FALSE
plugin-authentication-webauthn-client-preserve-privacy FALSE
plugin-authentication-webauthn-device                  0
register-factor                                        (No default value)
system-command                                         FALSE
command terminated with exit code 1
tomrausch66@cloudshell:~ (fresh-sequence-268900)$ kubectl exec mysql-6c69cd545-r62mx -- mysql SHOW DATABASES;
mysql  Ver 9.3.0 for Linux on x86_64 (MySQL Community Server - GPL)
Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Usage: mysql [OPTIONS] [database]
  -?, --help          Display this help and exit.
  -I, --help          Synonym for -?
  --auto-rehash       Enable automatic rehashing. One doesn't need to use
                      'rehash' to get table and field completion, but startup
                      and reconnecting may take a longer time. Disable with
                      --disable-auto-rehash.
                      (Defaults to on; use --skip-auto-rehash to disable.)
  -A, --no-auto-rehash 
                      No automatic rehashing. One has to use 'rehash' to get
                      table and field completion. This gives a quicker start of
                      mysql and disables rehashing on reconnect.
  --auto-vertical-output 
                      Automatically switch to vertical output mode if the
                      result is wider than the terminal width.
  -B, --batch         Don't use history file. Disable interactive behavior.
                      (Enables --silent.)
  --bind-address=name IP address to bind to.
  --binary-as-hex     Print binary data as hex. Enabled by default for
                      interactive terminals.
  --character-sets-dir=name 
                      Directory for character set files.
  --column-type-info  Display column type information.
  -c, --comments      Preserve comments. Send comments to the server. The
                      default is --comments (keep comments), disable with
                      --skip-comments.
                      (Defaults to on; use --skip-comments to disable.)
  -C, --compress      Use compression in server/client protocol.
  -#, --debug[=#]     This is a non-debug version. Catch this and exit.
  --debug-check       This is a non-debug version. Catch this and exit.
  -T, --debug-info    This is a non-debug version. Catch this and exit.
  -D, --database=name Database to use.
  --default-character-set=name 
                      Set the default character set.
  --delimiter=name    Delimiter to be used.
  --enable-cleartext-plugin 
                      Enable/disable the clear text authentication plugin.
  -e, --execute=name  Execute command and quit. (Disables --force and history
                      file.)
  -E, --vertical      Print the output of a query (rows) vertically.
  -f, --force         Continue even if we get an SQL error.
  --histignore=name   A colon-separated list of patterns to keep statements
                      from getting logged into syslog and mysql history.
  -G, --named-commands 
                      Enable named commands. Named commands mean this program's
                      internal commands; see mysql> help . When enabled, the
                      named commands can be used from any line of the query,
                      otherwise only from the first line, before an enter.
                      Disable with --disable-named-commands. This option is
                      disabled by default.
  -i, --ignore-spaces Ignore space after function names.
  --init-command=name Single SQL Command to execute when connecting to MySQL
                      server. Will automatically be re-executed when
                      reconnecting.
  --init-command-add=name 
                      Add SQL command to the list to execute when connecting to
                      MySQL server. Will automatically be re-executed when
                      reconnecting.
  --local-infile      Enable/disable LOAD DATA LOCAL INFILE.
  -b, --no-beep       Turn off beep on error.
  -h, --host=name     Connect to host.
  --dns-srv-name=name Connect to a DNS SRV resource
  -H, --html          Produce HTML output.
  -X, --xml           Produce XML output.
  --line-numbers      Write line numbers for errors.
                      (Defaults to on; use --skip-line-numbers to disable.)
  -L, --skip-line-numbers 
                      Don't write line number for errors.
  -n, --unbuffered    Flush buffer after each query.
  --column-names      Write column names in results.
                      (Defaults to on; use --skip-column-names to disable.)
  -N, --skip-column-names 
                      Don't write column names in results.
  --sigint-ignore     Ignore SIGINT (CTRL-C).
  -o, --one-database  Ignore statements except those that occur while the
                      default database is the one named at the command line.
  --pager[=name]      Pager to use to display results. If you don't supply an
                      option, the default pager is taken from your ENV variable
                      PAGER. Valid pagers are less, more, cat [> filename],
                      etc. See interactive help (\h) also. This option does not
                      work in batch mode. Disable with --disable-pager. This
                      option is disabled by default.
  -p, --password[=name] 
                      Password to use when connecting to server. If password is
                      not given it's asked from the tty.
  -,, --password1[=name] 
                      Password for first factor authentication plugin.
  -,, --password2[=name] 
                      Password for second factor authentication plugin.
  -,, --password3[=name] 
                      Password for third factor authentication plugin.
  -P, --port=#        Port number to use for connection or 0 for default to, in
                      order of preference, my.cnf, $MYSQL_TCP_PORT,
                      /etc/services, built-in default (3306).
  --prompt=name       Set the mysql prompt to this value.
  --protocol=name     The protocol to use for connection (tcp, socket, pipe,
                      memory).
  -q, --quick         Don't cache result, print it row by row. This may slow
                      down the server if the output is suspended. Doesn't use
                      history file.
  -r, --raw           Write fields without conversion. Used with --batch.
  --reconnect         Reconnect if the connection is lost. Disable with
                      --disable-reconnect. This option is enabled by default.
                      (Defaults to on; use --skip-reconnect to disable.)
  -s, --silent        Be more silent. Print results with a tab as separator,
                      each row on new line.
  -S, --socket=name   The socket file to use for connection.
  --server-public-key-path=name 
                      File path to the server public RSA key in PEM format.
  --get-server-public-key 
                      Get server public key
  --ssl-mode=name     SSL connection mode.
  --ssl-ca=name       CA file in PEM format.
  --ssl-capath=name   CA directory.
  --ssl-cert=name     X509 cert in PEM format.
  --ssl-cipher=name   SSL cipher to use.
  --ssl-key=name      X509 key in PEM format.
  --ssl-crl=name      Certificate revocation list.
  --ssl-crlpath=name  Certificate revocation list path.
  --tls-version=name  TLS version to use, permitted values are: TLSv1.2,
                      TLSv1.3
  --ssl-fips-mode=name 
                      SSL FIPS mode (applies only for OpenSSL); permitted
                      values are: OFF, ON, STRICT
  --tls-ciphersuites=name 
                      TLS v1.3 cipher to use.
  --ssl-session-data=name 
                      Session data file to use to enable ssl session reuse
  --ssl-session-data-continue-on-failed-reuse 
                      If set to ON, this option will allow connection to
                      succeed even if session data cannot be reused.
  --tls-sni-servername=name 
                      The SNI server name to pass to server
  -t, --table         Output in table format.
  --tee=name          Append everything into outfile. See interactive help (\h)
                      also. Does not work in batch mode. Disable with
                      --disable-tee. This option is disabled by default.
  -u, --user=name     User for login if not current user.
  -U, --safe-updates  Only allow UPDATE and DELETE that uses keys.
  -U, --i-am-a-dummy  Synonym for option --safe-updates, -U.
  -v, --verbose       Write more. (-v -v -v gives the table output format).
  -V, --version       Output version information and exit.
  -w, --wait          Wait and retry if connection is down.
  --connect-timeout=# Number of seconds before connection timeout.
  --max-allowed-packet=# 
                      The maximum packet length to send to or receive from
                      server.
  --net-buffer-length=# 
                      The buffer size for TCP/IP and socket communication.
  --select-limit=#    Automatic limit for SELECT when using --safe-updates.
  --max-join-size=#   Automatic limit for rows in a join when using
                      --safe-updates.
  --show-warnings     Show warnings after every statement.
  -j, --syslog        Log filtered interactive commands to syslog. Filtering of
                      commands depends on the patterns supplied via histignore
                      option besides the default patterns.
  --plugin-dir=name   Directory for client-side plugins.
  --default-auth=name Default authentication client-side plugin to use.
  --binary-mode       By default, ASCII '\0' is disallowed and '\r\n' is
                      translated to '\n'. This switch turns off both features,
                      and also turns off parsing of all clientcommands except
                      \C and DELIMITER, in non-interactive mode (for input
                      piped to mysql or loaded using the 'source' command).
                      This is necessary when processing output from mysqlbinlog
                      that may contain blobs.
  --connect-expired-password 
                      Notify the server that this client is prepared to handle
                      expired password sandbox mode.
  --network-namespace=name 
                      Network namespace to use for connection via tcp with a
                      server.
  --compression-algorithms=name 
                      Use compression algorithm in server/client protocol.
                      Valid values are any combination of
                      'zstd','zlib','uncompressed'.
  --zstd-compression-level=# 
                      Use this compression level in the client/server protocol,
                      in case --compression-algorithms=zstd. Valid range is
                      between 1 and 22, inclusive. Default is 3.
  --load-data-local-dir=name 
                      Directory path safe for LOAD DATA LOCAL INFILE to read
                      from.
  --authentication-oci-client-config-profile=name 
                      Specifies the configuration profile whose configuration
                      options are to be read from the OCI configuration file.
                      Default is DEFAULT.
  --oci-config-file=name 
                      Specifies the location of the OCI configuration file.
                      Default for Linux is ~/.oci/config and %HOME/.oci/config
                      on Windows.
  --authentication-openid-connect-client-id-token-file=name 
                      Specifies the location of the ID token file.
  --telemetry-client  Load the telemetry_client plugin.
  --plugin-authentication-webauthn-client-preserve-privacy 
                      Allows selection of discoverable credential to be used
                      for signing challenge. default is false - implies
                      challenge is signed by all credentials for given relying
                      party.
  --plugin-authentication-webauthn-device=# 
                      Specifies what libfido2 device to use. 0 (the first
                      device) is the default.
  --register-factor=name 
                      Specifies factor for which registration needs to be done
                      for.
  --system-command    Enable or disable (by default) the 'system' mysql
                      command.

Default options are read from the following files in the given order:
/etc/my.cnf /etc/mysql/my.cnf /usr/etc/my.cnf ~/.my.cnf 
The following groups are read: mysql client
The following options may be given as the first argument:
--print-defaults        Print the program argument list and exit.
--no-defaults           Don't read default options from any option file,
                        except for login file.
--defaults-file=#       Only read default options from the given file #.
--defaults-extra-file=# Read this file after the global files are read.
--defaults-group-suffix=#
                        Also read groups with concat(group, suffix)
--login-path=#          Read this path from the login file.
--no-login-paths        Don't read login paths from the login path file.

Variables (--variable-name=value)
and boolean options {FALSE|TRUE}                       Value (after reading options)
------------------------------------------------------ -------------------
auto-rehash                                            TRUE
auto-vertical-output                                   FALSE
bind-address                                           (No default value)
binary-as-hex                                          FALSE
character-sets-dir                                     (No default value)
column-type-info                                       FALSE
comments                                               TRUE
compress                                               FALSE
database                                               (No default value)
default-character-set                                  auto
delimiter                                              ;
enable-cleartext-plugin                                FALSE
vertical                                               FALSE
force                                                  FALSE
histignore                                             (No default value)
named-commands                                         FALSE
ignore-spaces                                          FALSE
local-infile                                           FALSE
no-beep                                                FALSE
host                                                   (No default value)
dns-srv-name                                           (No default value)
html                                                   FALSE
xml                                                    FALSE
line-numbers                                           TRUE
unbuffered                                             FALSE
column-names                                           TRUE
sigint-ignore                                          FALSE
port                                                   0
prompt                                                 mysql> 
quick                                                  FALSE
raw                                                    FALSE
reconnect                                              FALSE
socket                                                 /var/run/mysqld/mysqld.sock
server-public-key-path                                 (No default value)
get-server-public-key                                  FALSE
ssl-ca                                                 (No default value)
ssl-capath                                             (No default value)
ssl-cert                                               (No default value)
ssl-cipher                                             (No default value)
ssl-key                                                (No default value)
ssl-crl                                                (No default value)
ssl-crlpath                                            (No default value)
tls-version                                            (No default value)
tls-ciphersuites                                       (No default value)
ssl-session-data                                       (No default value)
ssl-session-data-continue-on-failed-reuse              FALSE
tls-sni-servername                                     (No default value)
table                                                  FALSE
user                                                   (No default value)
safe-updates                                           FALSE
i-am-a-dummy                                           FALSE
wait                                                   FALSE
connect-timeout                                        0
max-allowed-packet                                     16777216
net-buffer-length                                      16384
select-limit                                           1000
max-join-size                                          1000000
show-warnings                                          FALSE
plugin-dir                                             (No default value)
default-auth                                           (No default value)
binary-mode                                            FALSE
connect-expired-password                               FALSE
network-namespace                                      (No default value)
compression-algorithms                                 (No default value)
zstd-compression-level                                 3
load-data-local-dir                                    (No default value)
authentication-oci-client-config-profile               (No default value)
oci-config-file                                        (No default value)
authentication-openid-connect-client-id-token-file     (No default value)
telemetry-client                                       FALSE
plugin-authentication-webauthn-client-preserve-privacy FALSE
plugin-authentication-webauthn-device                  0
register-factor                                        (No default value)
system-command                                         FALSE
command terminated with exit code 1
tomrausch66@cloudshell:~ (fresh-sequence-268900)$ kubectl exec mysql-6c69cd545-r62mx -- /bin/bash
tomrausch66@cloudshell:~ (fresh-sequence-268900)$ kubectl exec mysql-6c69cd545-r62mx -it -- /bin/bash
bash-5.1# mysql
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
bash-5.1# mysql -p SecretPassword
Enter password: 
ERROR 1049 (42000): Unknown database 'SecretPassword'
bash-5.1# mysql -p               
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
bash-5.1# mysql -p 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3053
Server version: 9.3.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.021 sec)

mysql>
```

```
bash-5.1# df
Filesystem     1K-blocks    Used Available Use% Mounted on
overlay         98831908 6418032  92397492   7% /
tmpfs              65536       0     65536   0% /dev
/dev/sdb        20466256      24  20449848   1% /mnt/data
/dev/sda1       98831908 6418032  92397492   7% /etc/hosts
shm                65536       0     65536   0% /dev/shm
tmpfs            6099332      12   6099320   1% /run/secrets/kubernetes.io/serviceaccount
tmpfs            4069056       0   4069056   0% /proc/acpi
tmpfs            4069056       0   4069056   0% /proc/scsi
tmpfs            4069056       0   4069056   0% /sys/firmware
```

### References
- [Deploying MySQL on Kubernetes](https://medium.com/@midejoseph24/deploying-mysql-on-kubernetes-16758a42a746) | [Joseph Ariyo](https://medium.com/@midejoseph24/), Medium
- [Exposing an External IP Address to Access an Application in a Cluster](https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/) | kubernetes.io
- [Kubernetes Deployment: Deploying MySQL databases on the GKE](https://medium.com/globant/kubernetes-deployment-deploying-mysql-databases-on-the-gke-8fa675d3d8a) | MEdium
- [Using pre-existing persistent disks as PersistentVolumes](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/preexisting-pd) | Google



<hr/>

## Deploy VSCode With Keycloak Authentication

### Create Namespaces

```
$ kubectl create namespace vscode
namespace/vscode created
$ kubectl create namespace keycloak
namespace/keycloak created
```


### Add Helm Repository bitnami

```
$ helm repo add bitnami https://charts.bitnami.com/bitnami
"bitnami" has been added to your repositories
$ helm repo update
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "bitnami" chart repository
Update Complete. ⎈Happy Helming!⎈
```

### Install keycloak

```
$ helm install keycloak bitnami/keycloak --namespace keycloak --set auth.adminUser=admin --set auth.adminPassword=$PassCloak01$ --set postgresql.auth.postgresPassword=$PassGres01$ --set service.type=ClusterIP
NAME: keycloak
LAST DEPLOYED: Mon Apr 28 22:17:26 2025
NAMESPACE: keycloak
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: keycloak
CHART VERSION: 24.6.1
APP VERSION: 26.2.1

Did you know there are enterprise versions of the Bitnami catalog? For enhanced secure software supply chain features, unlimited pulls from Docker, LTS support, or application customization, see Bitnami Premium or Tanzu Application Catalog. See https://www.arrow.com/globalecs/na/vendors/bitnami for more information.

** Please be patient while the chart is being deployed **

Keycloak can be accessed through the following DNS name from within your cluster:

    keycloak.keycloak.svc.cluster.local (port 80)

To access Keycloak from outside the cluster execute the following commands:

1. Get the Keycloak URL by running these commands:

    export HTTP_SERVICE_PORT=$(kubectl get --namespace keycloak -o jsonpath="{.spec.ports[?(@.name=='http')].port}" services keycloak)
    kubectl port-forward --namespace keycloak svc/keycloak ${HTTP_SERVICE_PORT}:${HTTP_SERVICE_PORT} & echo "http://127.0.0.1:${HTTP_SERVICE_PORT}/"

2. Access Keycloak using the obtained URL.
3. Access the Administration Console using the following credentials:

  echo Username: admin
  echo Password: $(kubectl get secret --namespace keycloak keycloak -o jsonpath="{.data.admin-password}" | base64 -d)

WARNING: There are "resources" sections in the chart not set. Using "resourcesPreset" is not recommended for production. For production installations, please set the following values according to your workload needs:
  - resources
+info https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
```


keycloak.gke-7982bd164e1c4e0b86a390c66a0dfa818ad8-481851337886.us-central1.gke.goog



### References
- [Building a Secure Cloud IDE: Setting Up VS Code on Kubernetes with Keycloak Authentication](https://medium.com/@subhraj07/building-a-secure-cloud-ide-setting-up-vs-code-on-kubernetes-with-keycloak-authentication-f2769f828585) | Medium
- [DNS on GKE: Everything you need to know](https://medium.com/google-cloud/dns-on-gke-everything-you-need-to-know-b961303f9153) | Medium



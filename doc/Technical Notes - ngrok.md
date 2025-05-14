Setup Ingress


Local HTTPS Server
Forward to an upstream service listening for https

https://ngrok.com/docs/guides/developer-preview/getting-started/

Copy code
ngrok http http://

Use Traffic policy
https://ngrok.com/docs/traffic-policy/

ngrok http http://192.168.49.2:30834 --traffic-policy-file traffic-policy.yaml

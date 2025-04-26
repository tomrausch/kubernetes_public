# <img src=https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg width="25" height="25"> Kubernetes References

## Table Of Contents
🔴 <a href="#-overview">Overview</a>
<br>
⚪ <a href="#-diagrams">Diagrams</a>
<br>
🟤 <a href="#-medium">Articles</a>
<br>
🟣 <a href="#-cloud-providers">Cloud Providers</a>
<br>
🟡 <a href="#-examination-resources">Examination Resources</a>
<br>
⚪  <a href="#-library">Library</a>
<br>
🟠 <a href="#-online-resources">Online Resources</a>
<br>
🟢 <a href="#-playgroundsandbox">Playground/Sandbox</a>
<br>
⚪ <a href="#-projects">Projects</a>
<br>
⚫ <a href="#-tools">Tools</a>
<br>
🔵 <a href="#-training">Training</a>
<br>
⚪ <a href="#-further-study">Further Study</a>


## 🔴 Overview
> However, Kubernetes has a steep learning curve. Unlike fully managed container services, which require minimal setup, Kubernetes involves concepts like pods, services, ingress controllers, and networking policies, which can be overwhelming for beginners. Managing workloads, security policies, and networking configurations requires a solid understanding of the platform.

- 📃 [What is Kubernetes?](https://opensource.com/resources/what-is-kubernetes) | opensource.com
- <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbwWJwyGboFanXjneLUsglPpp6iqGYTJktwjPvXIrQ4mO9sqGJuoxdL8Gj1tDfzC2jdC6zE4SzoxBEUiVEla1IihyrnOb8pkrGHBa2ILg" width=20 height=20> [How Kubernetes Works](https://www.cncf.io/blog/2019/08/19/how-kubernetes-works/) | Cloud Native Computing Foundation
- <img src=https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg width="20" height="20"> [Access Clusters Using the Kubernetes API](https://kubernetes.io/docs/tasks/administer-cluster/access-cluster-api/) | kubernetes.io
- 📃 [Kubernetes vs Docker - A Detailed Comparison](https://refine.dev/blog/kubernetes-vs-docker/#brief-introduction-to-docker-and-kubernetes) | refine.dev
- 🎦 [Introduction to Kubernetes](https://atos365.sharepoint.com/sites/globalinternalautomationcommunity/_layouts/15/stream.aspx?id=%2Fsites%2Fglobalinternalautomationcommunity%2FShared%20Documents%2FApps%2FYammer%2FKubernetes_%20Introduction-20240521_180154-Meeting%20Recording%2Emp4&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2Ee718c7dc-8dbd-4b33-9af9-ceae8ca2e311) | Apurva Rajmne, Atos Internal Automation Community (2024-05-21)
- 🎦 [Kubernetes Cluster Overview](https://atos365-my.sharepoint.com/personal/paulina_zaremba_atos_net/_layouts/15/stream.aspx?id=%2Fpersonal%2Fpaulina%5Fzaremba%5Fatos%5Fnet%2FDocuments%2FRecordings%2FPOC%20daily%20call%2D20231026%5F150259%2DMeeting%20Recording%2Emp4) | Dan Merron, Atos (2023-10-26)
- <img src="https://cdn-icons-png.flaticon.com/512/1384/1384060.png" width=20 height=20></img> [MID Server on a Docker Container](https://www.youtube.com/watch?v=1Wc1fm-xMO8) | Justin Meadows, YouTube

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>


## 🌠 Diagrams

### Kubernetes Architecture
![image](https://github.com/user-attachments/assets/c109c981-2bbc-4993-946c-e1a5fd6156d7)

### Kubernetes Cluster
![image](https://github.com/user-attachments/assets/f1aae335-302e-4f86-b898-15c761ad6901)

### Kubernetes Overview Diagrams

#### Kubernetes Architecture
<img src=https://shipit.dev/static/images/k8s-architecture.svg width="588" height="400">

#### Kubernetes Networking Objects
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="https://shipit.dev/static/images/k8s-network.svg" width="588" height="400">

#### Kubernetes Resource-Based Access Control (RBAC) Objects
<img src="https://shipit.dev/static/images/k8s-rbac.svg" width="588" height="400">

#### Kubernetes Storage Objects
<img src="https://shipit.dev/static/images/k8s-storage.svg" width="588" height="400">

#### Kubernetes Workload Objects
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src=https://shipit.dev/static/images/k8s-workloads.svg width="588" height="400">

#### Kubernetes Resource Requests And Limits
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src=https://shipit.dev/static/images/k8s-resources.svg width="588" height="400">

Source: [Kubernetes Overview Diagrams](https://shipit.dev/posts/kubernetes-overview-diagrams.html) | Max Brenner

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>


## 🟤 Articles
- [A Guide to Kubernetes](https://medium.com/@serokell/a-guide-to-kubernetes-9df8f1c50ef7) | [Serokell](https://medium.com/@serokell), [Medium](https://medium.com/)
- [Advanced Kubernetes Pod Concepts Every DevOps Engineer Should Know](https://medium.com/@haroldfinch01/advanced-kubernetes-pod-concepts-every-devops-engineer-should-know-501112890f01) | [Harold Finch](https://medium.com/@haroldfinch01),  [Medium](https://medium.com/)
- [Top Kubernetes Features Every DevOps Engineer Should Know In 2025](https://medium.com/@osomudeyazudonu/top-kubernetes-features-every-devops-engineer-should-know-in-2025-d1ba3ca77cab) | [Zudonu Osomudeya](https://medium.com/@osomudeyazudonu),  [Medium](https://medium.com/)
- [Top Kubernetes Tools for 2024](https://medium.com/spacelift/26-top-kubernetes-tools-for-2024-6809b2f0d5d4) | James Walker, [Spacelift](https://medium.com/spacelift), [Medium](https://medium.com/)
- [Five Advanced Kubernetes Operators Every DevOps Engineer Should Know](https://medium.com/itnext/5-advanced-kubernetes-operators-every-devops-engineer-should-know-about-ab46bdc1c7d5) | [Piotr](https://piotrzan.medium.com/), [ITNEXT](https://itnext.io/), [Medium](https://medium.com/)
- [Five Best GitOps Tools for Developers in 2024](https://medium.com/atmosly/the-5-best-gitops-tools-for-developers-in-2024-8be774f309a8) | [Ankush Madaan](https://medium.com/@contact_81356), [Medium](https://medium.com/)
- [Five Kubernetes CLI Tools You Must Try in 2024](https://medium.com/gitconnected/5-kubernetes-cli-tools-you-must-try-in-2024-8a587890bf6a) | [Kawin Promsopa](https://medium.com/@kawin.promsopa), [Level Up Coding](https://levelup.gitconnected.com/), [Medium](https://medium.com/)
- [Five Kubernetes CLI Tools You Must Try in 2025](https://medium.com/faun/5-kubernetes-cli-tools-you-must-try-in-2025-e03aedd462e1) | [Ali Hamza](https://medium.com/@ali_hamza), [DevOps.dev](https://blog.devops.dev/), [Medium](https://medium.com/)
- [Five Kubernetes Concepts That Every Developer Needs To Know](https://medium.com/@kamaljp/5-kubernetes-concepts-that-every-developer-needs-to-know-23265c0e56dd) | [Qrious Kamal](https://medium.com/@kamaljp), [Medium](https://medium.com/)
- [Seven Essential Kubernetes Tools You Didn’t Know You Needed](https://medium.com/@haroldfinch01/7-essential-kubernetes-tools-you-didnt-know-you-needed-c3da18a6b547) | [Harold Finch](https://medium.com/@haroldfinch01), [Medium](https://medium.com/)
- [Seven Of The Best Tools For Kubernetes](https://www.xda-developers.com/best-tools-for-kubernetes/) | [XDA](https://www.xda-developers.com)
- [Ten Best Kubernetes Tools to Use in 2024](https://medium.com/@lognoroy2000/10-best-kubernetes-tools-to-use-in-2024-8bed0cc3068c) | [Mouri Roy](https://medium.com/@lognoroy2000), [Medium](https://medium.com/)
- [Ten Container Concepts That Often Confuse Beginners](https://medium.com/@howtouselinux/top-10-containerization-concepts-that-often-confuse-beginners-54309b123df4) | [howtouselinux](https://howtouselinux.medium.com/), [Medium](https://medium.com/)
- [Ten Kubernetes Pod Concepts That Confuse Beginners](https://medium.com/frontend-canteen/top-10-kubernetes-pod-concepts-that-confuse-beginners-8c0954021f3f) | [howtouselinux](https://howtouselinux.medium.com/), [Medium](https://medium.com/)
- [Ten Essential Kubernetes Tools You Didn’t Know You Needed](https://medium.com/itnext/10-essential-kubernetes-tools-you-didnt-know-you-needed-06954251d845) | [Piotr](https://piotrzan.medium.com/), [Medium](https://medium.com/)
- [Ten Questions to Test Your Understanding of Kubernetes](https://medium.com/@emafzal/10-kubernetes-questions-to-test-your-understanding-of-k8s-416360dd5c8e) | [Muhammad Afzal](https://medium.com/@emafzal), [Medium](https://medium.com/)
- [Ten Questions to Test Your Understanding of Kubernetes](https://medium.com/@naveen-metta/10-questions-to-test-your-understanding-of-kubernetes-a-beginner-friendly-guide-fd5e1bd70735) | [Naveen Metta](https://medium.com/@naveen-metta/), [Medium](https://medium.com/)
- [Ten Questions to Test Your Understanding of Kubernetes](https://medium.com/@rifewang/kubernetes-10-questions-to-test-your-understanding-of-k8s-c2860c9f3cbf) | [Rifewang](https://medium.com/@rifewang/), [Medium](https://medium.com/)
- [Thirteen Kubernetes CLI Tools You Should Know](https://medium.com/overcast-blog/13-kubernetes-cli-tools-you-should-know-439270d27257) | [DavidW](https://medium.com/@dskydragon), [Overcast](https://medium.com/overcast-blog/) [Medium](https://medium.com/)
- [Thirteen Kubernetes Tools You Should Know in 2024](https://medium.com/overcast-blog/13-kubernetes-tools-your-should-know-in-2024-4e857124c176) | [DavidW](https://medium.com/@dskydragon), [Overcast](https://medium.com/overcast-blog/), [Medium](https://medium.com/)
- [Fifteen Kubernetes One-Liners to Simplify Cluster Management](https://blog.devops.dev/15-kubernetes-one-liners-to-simplify-cluster-management-8fe03825ea1f) | [Obafemi](https://medium.com/@obaff), [DevOps.dev](https://blog.devops.dev/), [Medium](https://medium.com/)
- [Fifteen Kubernetes Tools Everyone Is Thankful For in 2024](https://medium.com/@PlanB./top-15-kubernetes-tools-everyone-is-thankful-for-in-2024-e805156753d8) | [Mr.PlanB](https://medium.com/@PlanB.), [Medium](https://medium.com/)
- [Top 15 Secret Kubernetes Tricks You Didn’t Know](https://medium.com/@haroldfinch01/top-15-secret-kubernetes-tricks-you-didnt-know-d4cf38334f06) | [Harold Finch](https://medium.com/@haroldfinch01), [Medium](https://medium.com/)
- [Seventeen Kubernetes Best Practices Every Developer Should Know](https://spacelift.io/blog/kubernetes-best-practices) | [Jack roper](https://spacelift.io/blog/author/jackr), [Spacelift](https://spacelift.io/)
- [Eighteen Kubernetes Security Tools You Should Know](https://medium.com/overcast-blog/18-kubernetes-security-tools-you-should-know-f3f13425df7b) | [DavidW](https://medium.com/@dskydragon), [Overcast](https://medium.com/overcast-blog/),  [Medium](https://medium.com/)
- [Access Azure Kubernetes Service (AKS) Kubernetes Cluster Programmatically](https://abyjacob1.medium.com/access-azure-aks-kubernetes-cluster-programmatically-b74f1311b386) | [Aby Jacob](https://abyjacob1.medium.com/), [Medium](https://medium.com/)
- [Advanced Kubernetes Pod Concepts That You Should Know as a Beginner](https://medium.com/devops-dev/advanced-kubernetes-pod-concepts-that-you-should-know-as-a-beginner-50c9ca1327fc) | [Ali Hamza](https://medium.com/@ali_hamza), [DevOps.dev](https://blog.devops.dev/), [Medium](https://medium.com/)
- [Awesome Kubernetes Resources](https://github.com/tomhuang12/awesome-k8s-resources/blob/main/readme.md) | [Tom Huang](https://github.com/tomhuang12/), [GitHub](https://github.com/)
- [Best Kubernetes UI Tools for On-Prem Clusters - Rancher, Lens, Headlamp And More](https://medium.com/@PlanB./best-kubernetes-ui-tools-for-on-prem-clusters-rancher-lens-headlamp-more-113eb635283f) | [Mr.PlanB](https://medium.com/@PlanB.), [Medium](https://medium.com/)
- [Debugging Kubernetes Issues In Production - A Technical Guide](https://medium.com/@hervekhg/debugging-kubernetes-issues-in-production-a-technical-guide-9e3d26e27180) | [Herve Khg](https://medium.com/@hervekhg/), [Medium](https://medium.com/)
- [Docker Swarm vs. Kubernetes: Battle Of The Container Orchestration Platforms](https://www.xda-developers.com/docker-swarm-vs-kubernetes/) | [XDA](https://www.xda-developers.com)
- [Embracing Containerization: An In-depth Exploration of Docker, Kubernetes, and Node.js](https://medium.com/@nonamedev/docker-and-kubernetes-are-two-essential-tools-for-modern-software-development-and-deployment-d1e889df5a97) | [NoNameDev](https://medium.com/@nonamedev/), [Medium](https://medium.com/)
- [The Evolution of Kubernetes - Architecture and Origins](https://medium.com/dev-genius/the-evolution-of-kubernetes-architecture-and-origins-ffd708ab9cae) |[Geethika Sandamali](https://medium.com/@gsandamali30), [Dev Genius](https://blog.devgenius.io/), [Medium](https://medium.com/)
- [Exploring Kubernetes Service Types: ClusterIP vs. NodePort vs. LoadBalancer vs. Headless Services](https://edgedelta.com/company/blog/kubernetes-services-types) | [Edge Delta](https://edgedelta.com/)
- [Hierarchical Namespaces in Kubernetes](https://medium.com/faun/hierarchical-namespaces-in-kubernetes-5b07ea2c3e65) | [Sanjit Mohanty](https://medium.com/@sanjimoh), [FAUN — Developer Community](https://faun.pub/), [Medium](https://medium.com/)
- [How to Manage Configurations and Secrets in Kubernetes](https://medium.com/devops-dev/how-to-manage-configurations-and-secrets-in-kubernetes-20d3458ce9b2) | [Ali Hamza](https://medium.com/@ali_hamza), [DevOps.dev](https://blog.devops.dev/), [Medium](https://medium.com/)
- [I Ask This Question At Every Kubernetes Interview](https://medium.com/gitconnected/i-asked-this-kubernetes-question-in-every-interview-and-heres-the-catch-6d37cc7cb7a5) | [Rahul Sharma](https://devopstory.com/), [Level Up Coding](https://levelup.gitconnected.com/), [Medium](https://medium.com/)
- [Interviewing a Senior Kubernetes Developer - Here’s What You Should Really Ask](https://medium.com/@PlanB./interviewing-a-senior-kubernetes-developer-heres-what-you-should-really-ask-29dd1da21cff) | [Mr.PlanB](https://medium.com/@PlanB.), [Medium](https://medium.com/)
- [Just Set Up A Kubernetes Cluster? Here’s What You Actually Need Next](https://medium.com/@PlanB./just-set-up-a-kubernetes-cluster-heres-what-you-actually-need-next-b3bef7dfc2f8) | [Mr.PlanB](https://medium.com/@PlanB.), [Medium](https://medium.com/)
- [Kubernetes NodePort vs LoadBalancer vs Ingress? When should I use what?](https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0) | [Sandeep Dinesh](https://medium.com/@SandeepDinesh), [Google Cloud - Community](https://medium.com/google-cloud)
- [Kubernetes Core Resource Components](https://medium.com/dev-genius/kubernetes-core-resource-components-87f7384a9517) | [Geethika Sandamali](https://medium.com/@gsandamali30), [Dev Genius](https://blog.devgenius.io/), [Medium](https://medium.com/)
- [Kubernetes Troubleshooting Handbook](https://medium.com/itnext/the-kubernetes-troubleshooting-handbook-7596a1fdf2ff) | [Piotr](https://piotrzan.medium.com/), [Medium](https://medium.com/)
- [Load Balancer Vs Ingress — Why do we need both for same work?](https://medium.com/@thekubeguy/load-balancer-vs-ingress-why-do-we-need-both-for-same-work-3ae2b9afdd5a) | [The kube guy](https://medium.com/@thekubeguy), [Medium](https://medium.com/)
- [Mastering Kubernetes In The Cloud - A Guide to Cloud Controller Manager](https://www.itprotoday.com/cloud-computing/mastering-kubernetes-in-the-cloud-a-guide-to-cloud-controller-manager) | [ITPro Today](https://www.itprotoday.com/)
- [Mastering Kubernetes Networking: A Guide to Services, Ingress, and Network Policies](https://medium.com/@michaelarauza/mastering-kubernetes-networking-a-guide-to-services-ingress-and-network-policies-ddf9abdb433b) | [Michael Arauza](https://medium.com/@michaelarauza), [Medium](https://medium.com/)
- [Mastering Kubernetes Networking: Types, Setup, and Best Practices](https://medium.com/faun/mastering-kubernetes-networking-types-setup-and-best-practices-4274ed2cba94) | [Ali Hamza](https://medium.com/@ali_hamza), [FAUN Developer Community](https://faun.pub/), [Medium](https://medium.com/)
- [Mastering Kubernetes Networking: Types, Setup, and Best Practices](https://medium.com/@kalimitalha8/mastering-kubernetes-networking-types-setup-and-best-practices-8e95a1c956c6) | [Mohammed Talha Kalimi](https://medium.com/@kalimitalha8/), [Medium](https://medium.com/)
- [My Kubernetes Pods Keep Crashing With “CrashLoopBackOff” But I Can’t Find Any Log](https://medium.com/@haroldfinch01/my-kubernetes-pods-keep-crashing-with-crashloopbackoff-but-i-cant-find-any-log-de6eb5946776) | [Harold Finch](https://medium.com/@haroldfinch01), [Medium](https://medium.com/)
- [NGINX Zero To Hero](https://medium.com/devops-dev/nginx-zero-to-hero-your-ultimate-guide-from-beginner-to-advanced-mastery-4060950f6405) | [Ali Hamza](https://medium.com/@ali_hamza), [DevOps.dev](https://blog.devops.dev/), [Medium](https://medium.com/)
- [NGINX Zero To Hero](https://medium.com/@ksaquib/nginx-zero-to-hero-your-ultimate-guide-from-beginner-to-advanced-mastery-57e2dad6a77a) | [Saquib Khan](https://medium.com/@ksaquib/), [Medium](https://medium.com/)
- [NGINX Zero To Hero](https://medium.com/h7w/nginx-zero-to-hero-your-ultimate-guide-from-beginner-to-advanced-mastery-ac7e4c6b9795) | [Usama Malik](https://medium.com/@cloudwithusama), [T3CH](https://medium.com/h7w/), [Medium](https://medium.com/)
- [On-Premises Kubernetes: Is Kubeadm or Rancher the Right Choice?](https://medium.com/@PlanB./on-premises-kubernetes-is-kubeadm-or-rancher-the-right-choice-c569e51773dc) | [Mr.PlanB](https://medium.com/@PlanB.), [Medium](https://medium.com/)
- [One Giant Kubernetes Cluster For Everything](https://blog.frankel.ch/one-giant-kubernetes-cluster/) | [Nicolas Fränkel](https://blog.frankel.ch/)
- [Open-Source Solutions to Simplify Kubernetes Cluster Management](https://medium.com/@PlanB./open-source-solutions-to-simplify-kubernetes-cluster-management-8ab62ffe2188) | [Mr.PlanB](https://medium.com/@PlanB.), [Medium](https://medium.com/)
- [Setting Up a Solid Kubernetes Cluster: The Tools You Actually Need](https://medium.com/devops-dev/setting-up-a-solid-kubernetes-cluster-the-tools-you-actually-need-0cceedbd5bfc) | [Mr.PlanB](https://medium.com/@PlanB.), [DevOps.dev](https://blog.devops.dev/), [Medium](https://medium.com/)
- [Stop Guessing Kubernetes Issues — Use These Advanced Debugging Techniques!](https://medium.com/@howtouselinux/stop-guessing-kubernetes-issues-use-these-advanced-debugging-techniques-98326b76ad1d) | [howtouselinux](https://howtouselinux.medium.com/), [Medium](https://medium.com/)
- [Understanding Kubernetes Gateway API: A Beginner’s Guide](https://medium.com/itnext/understanding-kubernetes-gateway-api-a-beginners-guide-977bd9be73ed) | [Mayank Kumar](https://medium.com/@krmayank), [ITNEXT](https://itnext.io/), [Medium](https://medium.com/)

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>


## 🟣 Cloud Providers
### Microsoft Azure Kubernetes Service (AKS)
- 📃 [Core concepts for Azure Kubernetes Service (AKS)](https://learn.microsoft.com/en-us/azure/aks/concepts-clusters-workloads) | Microsoft Learn
- 📃 [Quickstart: Deploy a container instance in Azure using the Azure CLI](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-quickstart) | Microsoft Learn
- 📃 [Using Azure CLI to get info about your Azure Kubernetes Service (AKS) cluster](https://jreypo.io/2019/04/09/using-azure-cli-to-get-info-about-your-aks-cluster/) | Juan Reyes
### Amazon Elastic Kubernetes Service (EKS)
- 📃 [GitOps model for provisioning and bootstrapping Amazon EKS clusters using Crossplane and Argo CD](https://aws.amazon.com/blogs/containers/gitops-model-for-provisioning-and-bootstrapping-amazon-eks-clusters-using-crossplane-and-argo-cd/) | AWS

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>


## 🟡 Examination Resources
- <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbwWJwyGboFanXjneLUsglPpp6iqGYTJktwjPvXIrQ4mO9sqGJuoxdL8Gj1tDfzC2jdC6zE4SzoxBEUiVEla1IihyrnOb8pkrGHBa2ILg" width=20 height=20> [Certified Kubernetes Administrator](https://www.cncf.io/certification/cka/) | Cloud Native Computing Foundation
- <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbwWJwyGboFanXjneLUsglPpp6iqGYTJktwjPvXIrQ4mO9sqGJuoxdL8Gj1tDfzC2jdC6zE4SzoxBEUiVEla1IihyrnOb8pkrGHBa2ILg" width=20 height=20> [Candidate Handbook](https://www.cncf.io/certification/candidate-handbook) | Cloud Native Computing Foundation
- <img src="https://cdn.iconscout.com/icon/free/png-512/free-linux-foundation-logo-icon-download-in-svg-png-gif-file-formats--technology-social-media-company-brand-vol-4-pack-logos-icons-3031547.png" height=20 width=20></img> [Exam Tips](http://training.linuxfoundation.org/go//Important-Tips-CKA-CKAD) | Linux Foundation
- <img src="https://cdn.iconscout.com/icon/free/png-512/free-linux-foundation-logo-icon-download-in-svg-png-gif-file-formats--technology-social-media-company-brand-vol-4-pack-logos-icons-3031547.png" height=20 width=20></img> [Frequently Asked Questions: CKA and CKAD & CKS](https://docs.linuxfoundation.org/tc-docs/certification/faq-cka-ckad-cks) | Linux Foundation
- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Github-desktop-logo-symbol.svg/2048px-Github-desktop-logo-symbol.svg.png" width=20 height=20></img> [Exam Curriculum - Topics](https://github.com/cncf/curriculum) | GitHub
- <img src="https://avatars.githubusercontent.com/u/43662489?s=280&v=4" width=20 height=20></img> [CKA Certification Learning Path](https://kodekloud.com/learning-path/cka) | KodeKloud
- <img src="https://www.iconpacks.net/icons/2/free-reddit-logo-icon-2436-thumb.png" width=20 height=20></img> [CKA exam: good exercise/mock exam resources](https://www.reddit.com/r/kubernetes/comments/gldbkk/cka_exam_good_exercisemock_exam_resources/) | reddit
- <img src="https://cdn-1.webcatalog.io/catalog/killercoda/killercoda-icon-unplated.png" width=20 height=20></img> [Scenarios for the Certified Kubernetes Administrator](https://killercoda.com/cka) | KillerCoda

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>


## ⚪ Library

### Kubernetes
<hr/>

### [Certified Kubernetes Administrator (CKA) Study Guide](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781098107215/)
<img src="https://m.media-amazon.com/images/I/81KR53rtqCL._SL1500_.jpg" width=70 height=100></img>
- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Github-desktop-logo-symbol.svg/2048px-Github-desktop-logo-symbol.svg.png" width=20 height=20></img> [Examples And Exercises](https://github.com/bmuschko/cka-study-guide) | Benjamin Muschko, GitHub

<hr/>

### [Certified Kubernetes Application Developer (CKAD) Exam Prep Labs](https://learning-oreilly-com.prxy.stdl.org/playlists/2e9fe6dc-2a05-47fe-ae0a-34d6485287cc/)
<img src="https://vmdk.wordpress.com/wp-content/uploads/2018/09/256x256.png" width=70 height=100></img>

<hr/>

### [Certified Kubernetes Application Developer (CKAD) Study Guide, 2nd Edition](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781098152857/)
<img src="https://m.media-amazon.com/images/I/81x2M17sU-L._SL1500_.jpg" width=70 height=100></img>
- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Github-desktop-logo-symbol.svg/2048px-Github-desktop-logo-symbol.svg.png" width=20 height=20></img> [Examples And Exercises](https://github.com/bmuschko/ckad-study-guide) | Benjamin Muschko, GitHub

<hr/>

### [Certified Kubernetes Security Specialist (CKS) Study Guide](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781098132965/)
<img src="https://m.media-amazon.com/images/I/81Ljc9-Kb1L._SL1500_.jpg" width=70 height=100></img>
- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Github-desktop-logo-symbol.svg/2048px-Github-desktop-logo-symbol.svg.png" width=20 height=20></img> [Examples And Exercises](https://github.com/bmuschko/cks-study-guide) | Benjamin Muschko, GitHub

<hr/>

### [Cloud Native DevOps with Kubernetes, 2nd Edition](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781098116811/)
<img src="https://m.media-amazon.com/images/I/81b66iRUWZL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Hacking Kubernetes](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781492081722/)
<img src="https://m.media-amazon.com/images/I/81jY5hpGFWL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Kubernetes and Cloud Native Associate (KCNA) Study Guide](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781098138936/)
<img src="https://m.media-amazon.com/images/I/81Cx7Zg62mL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Kubernetes Best Practices, 2nd Edition](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781098142155/)
<img src="https://m.media-amazon.com/images/I/81cU+3wtSWL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Kubernetes Cookbook, 2nd Edition](https://learning-oreilly-com.prxy.stdl.org/library/view/kubernetes-cookbook-2nd/9781098142230/)
<img src="https://m.media-amazon.com/images/I/41JPPYcDmFL._SY445_SX342_.jpg" width=70 height=100></img>

<hr/>

### [Kubernetes Operators](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781492048039/)
<img src="https://m.media-amazon.com/images/I/81gbd-IwPeL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Kubernetes Patterns, 2nd Edition](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781098131678/)
<img src="https://m.media-amazon.com/images/I/81yrGVraEkL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Kubernetes Security and Observability](https://learning-oreilly-com.prxy.stdl.org/library/view/kubernetes-security-and/9781098107093/)
<img src="https://m.media-amazon.com/images/I/81wCkci1rvL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Kubernetes Up And Running, 3rd Edition](https://learning-oreilly-com.prxy.stdl.org/library/view/kubernetes-up-and/9781098110192/)
<img src="https://m.media-amazon.com/images/I/81fH7yJ8rsL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Managing Cloud Native Data on Kubernetes](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781098111380/)
<img src="https://m.media-amazon.com/images/I/81ko3wfMBFL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Managing Kubernetes](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781492033905/)
<img src="https://m.media-amazon.com/images/I/61zOwXvdCzL._SL1000_.jpg" width=70 height=100></img>

<hr/>

### [Networking and Kubernetes](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781492081647/)
<img src="https://m.media-amazon.com/images/I/81tL3fZFC-L._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Production Kubernetes](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781492092292/)
<img src="https://m.media-amazon.com/images/I/81CyHDZhpZL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Programming Kubernetes](https://learning-oreilly-com.prxy.stdl.org/library/view/-/9781492047094/)
<img src="https://m.media-amazon.com/images/I/81KTjOa3M5L._SL1500_.jpg" width=70 height=100></img>

<hr/>

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>


### Tools

<hr/>

### [Argo CD: Up and Running](https://learning-oreilly-com.prxy.stdl.org/library/view/argo-cd-up/9781098141998/)
<img src="https://m.media-amazon.com/images/I/81Ae94L22dL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [End-to-End Automation with Kubernetes and Crossplane](https://learning-oreilly-com.prxy.stdl.org/library/view/end-to-end-automation-with/9781801811545/)
<img src="https://c.media-amazon.com/images/I/61J80JgEZDL._AC_UY327_FMwebp_QL65_.jpg" width=70 height=100></img>

<hr/>

### [Learning Helm: Managing Apps on Kubernetes](https://learning-oreilly-com.prxy.stdl.org/library/view/learning-helm/9781492083641/)
<img src="https://m.media-amazon.com/images/I/81r5nqs-0HL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Terraform Cookbook, 3rd Edition](https://learning-oreilly-com.prxy.stdl.org/library/view/terraform-cookbook/9781098108458/)
<img src="https://m.media-amazon.com/images/I/812eFKXCZpL._SL1500_.jpg" width=70 height=100></img>

<hr/>

### [Terraform Up And Running, 3rd Edition](https://learning-oreilly-com.prxy.stdl.org/library/view/terraform-up-and/9781098116736/)
<img src="https://m.media-amazon.com/images/I/81TuTt5Sz3L._SL1500_.jpg" width=70 height=100></img>

<hr/>

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>


## 🟠 Online Resources
- <img src="https://www.iconpacks.net/icons/2/free-reddit-logo-icon-2436-thumb.png" width=20 height=20> [Kubernetes](https://www.reddit.com/r/kubernetes/) | reddit
- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Slack_icon_2019.svg/127px-Slack_icon_2019.svg.png?20200128081203" width=20 height=20> [Kubernetes](https://kubernetes.slack.com/) | Slack

### kubernetes.io
- <img src=https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg width="20" height="20">  [Kubernetes Home Page/Documentation](https://kubernetes.io/docs/home/)
- <img src=https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg width="20" height="20">  [Blog](https://kubernetes.io/blog/)
- <img src=https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg width="20" height="20">  [Client Libraries](https://kubernetes.io/docs/reference/using-api/client-libraries/)
- <img src=https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg width="20" height="20">  [Community](https://kubernetes.io/community/)
- <img src=https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg width="20" height="20">  [Home Page](https://kubernetes.io/)

### KodeKloud
- <img src="https://avatars.githubusercontent.com/u/43662489?s=280&v=4" width=20 height=20></img> [Community](https://kodekloud.com/pages/community)
- <img src="https://cdn-icons-png.flaticon.com/512/1384/1384060.png" width=20 height=20></img> [YouTube Channel](https://www.youtube.com/channel/UCSWj8mqQCcrcBlXPi4ThRDQ)
- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Github-desktop-logo-symbol.svg/2048px-Github-desktop-logo-symbol.svg.png" width=20 height=20></img> [Reference Notes For Lectures And Labs](https://github.com/kodekloudhub/certified-kubernetes-administrator-course) | GitHub
- <img src="https://avatars.githubusercontent.com/u/43662489?s=280&v=4" width=20 height=20></img> [Kubernetes-Skills-Development](https://kodekloud.com/pages/resources/kubernetes-skills-development)

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>


## 🟢 Playground/Sandbox
- <img src="https://cdn-1.webcatalog.io/catalog/killercoda/killercoda-icon-unplated.png" width=20 height=20></img> [Killercoda Interactive Environments](https://killercoda.com/) | KillerCoda
- <img src="https://cdn-1.webcatalog.io/catalog/killercoda/killercoda-icon-unplated.png" width=20 height=20></img> [Killercoda Interactive Environments - Kubernetes](https://killercoda.com/kubernetes) | KillerCoda
- <img src="https://avatars.githubusercontent.com/u/43662489?s=280&v=4" width=20 height=20></img> [PlayGrounds](https://kodekloud.com/playgrounds/) | KodeCloud
- 🎮 Tutorius/Docker
  - 🎮 [Play With Kubernetes](https://labs.play-with-k8s.com/)
  - 🎮 [Play with Kubernetes Classroom](https://training.play-with-kubernetes.com/)
- <img src="https://developers.redhat.com/sites/default/files/Red%20Hat%20OS%20Platform%402x.png" width=20 height=20></img> [Developer Sandbox](https://developers.redhat.com/developer-sandbox?fbclid=IwY2xjawJRqnRleHRuA2FlbQIxMAABHd7jhuDSlwFsrSGVFxY4EW9OkeDIzLr5ERhl9OzWFffYrlF95xYYH9oRMg_aem_RPWlt-Dfu-evTm1c7U_mCQ) | Red Hat Developer
- <img src="https://www.iconpacks.net/icons/2/free-reddit-logo-icon-2436-thumb.png" width=20 height=20> [Cheap or free Kubernetes cluster for learning purposes](https://www.reddit.com/r/devops/comments/17cu6wg/cheap_or_free_kubernetes_cluster_for_learning/) | reddit

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>


## ⚪ Projects
### Deploy A "Hello, World!" Application on Kubernetes
- [Exposing an External IP Address to Access an Application in a Cluster](https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/) | [kubernetes.io](https://kubernetes.io/)
- [Use a Service to Access an Application in a Cluster](https://kubernetes.io/docs/tasks/access-application-cluster/service-access-application-cluster/) | [kubernetes.io](https://kubernetes.io/)

### Deploy Homepage
- [Install homepage On Kubernetes](https://gethomepage.dev/installation/k8s/) | [homepage](https://gethomepage.dev/)

### Deploy kuard
- [kuard](https://github.com/kubernetes-up-and-running/kuard/blob/master/README.md) | Kubernetes Up And Running, GitHub

### Deploy MongoDB
- [Use Port Forwarding to Access Applications in a Cluster](https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/) | [kubernetes.io](https://kubernetes.io/)

### Deploy MySQL
- [Deploying MySQL on Kubernetes](https://medium.com/@midejoseph24/deploying-mysql-on-kubernetes-16758a42a746) | [Joseph Ariyo](https://medium.com/@midejoseph24/), [Medium](https://medium.com/)

### Deploy A PHP Guestbook Application With Redis
- [Example: Deploying PHP Guestbook application with Redis](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/) | [kubernetes.io](https://kubernetes.io/)

### Deploy A ServiceNow MID Server
- [Automated Mid Server Install](https://mtcoffee.github.io/automated-mid-server-install/) |
- REMOVED - [Instant MID Server with Docker - on Windows](https://www.servicenow.com/community/developer-articles/instant-mid-server-with-docker-on-windows/ta-p/2506365) | ServiceNow Community

### Deploy WordPress And MySQL With Persistent Volumes
- [Example: Deploying WordPress and MySQL with Persistent Volumes](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/) | [kubernetes.io](https://kubernetes.io/)

### Deploy A Production-Ready Three-Tier Application on Kubernetes: React Frontend + Flask Backend + Postgres Database 
- [Advanced Kubernetes Tutorial Every DevOps Engineer Has Been Searching For — Part 1](https://medium.com/towards-aws/stop-following-useless-tutorials-learn-kubernetes-on-aws-like-a-pro-1186aa8a33ac) /  | [Akhilesh Mishra](https://medium.com/@akhilesh-mishra), [Medium](https://medium.com/)

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>


## ⚫ Tools
### 🪛 Argo CD
### 🪛 Argo Rollouts
### 🪛 Cloud Providers
- Microsoft Azure Kubernetes Service (AKS)
- Amazon Elastic Kubernetes Service (EKS)
- Google Kubernetes Engine (GKE)
### 🪛 Flux | Automates Deployment Of Resources
### 🪛 Helm
- <img src="https://cdn-icons-png.flaticon.com/512/5968/5968906.png" width=20 height=20></img> [What Is Helm In Kubernetes? A Complete Guide](https://medium.com/@jake.page91/what-is-helm-in-kubernetes-a-complete-guide-5cdd060aced4) | Jake Page, Medium
- 🎦 [Helm Chart for ServiceNow Mid Server Deployment](https://github.com/GLB-ATOS-MSCC/mscc-helm-servicenow-midserver?files=1) | Waldemar Baldowski, Atos
### 🪛 Ingress NGINX | Ingress Controller
### 🪛 Istio
### 🪛 k3d | Run Kubernetes In Docker
### 🪛 k3s
### 🪛 [k9s](https://k9scli.io/)
- <img src="https://cdn-icons-png.flaticon.com/512/5968/5968906.png" width=20 height=20></img> [What is K9s?](https://mesutoezdil.medium.com/what-is-k9s-197e6db8ad6a) | Mesut Oezdil, Medium
### 🪛 kind
- [kind](https://kind.sigs.k8s.io/) is a tool for running local Kubernetes clusters using Docker container “nodes”
- kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI
### 🪛 kube ns & kube ctx
### 🪛 kube-bench
### 🪛 kube-linter | Linting
### 🪛 kubeadm
- <img src=https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg width="20" height="20"> [Administration with kubeadm](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/) | kubernetes.io
- <img src=https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg width="20" height="20"> [Access Clusters Using the Kubernetes API](https://kubernetes.io/docs/tasks/administer-cluster/access-cluster-api/) | kubernetes.io
### 🪛 kubecost | Monitor Kubernetes Costs
### 🪛 kubectl
- <img src=https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg width="20" height="20"> [Install and Set Up kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) | kubernetes.io
- <img src="https://cdn-icons-png.flaticon.com/512/5968/5968906.png" width=20 height=20></img> [The Guide To kubectl I Never Had](https://glasskube.dev/guides/kubectl/) | Jake Page, Glasskube & Medium 
### 🪛 kubectl-tree | Visualize Kubernetes Hierarchies As Trees
### 🪛 kubescape | Security Scanning
### 🪛 kubeshark | Analyze Kubernetes API Network Traffic
### 🪛 kustomize
### 🪛 KUTTL | Testing
### 🪛 Lens
### 🪛 Loki
### 🪛 minikube
### 🪛 mirrord | Remote Development
### 🪛 Metrics Server
### 🪛 popeye | Detect Configuration Issues
### 🪛 Portainer
### 🪛 Prometheus
### 🪛 Rancher
### 🪛 Spacelift
### 🪛 Terraform

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>


## 🔵 Training
### Docker
- <img src="https://pbs.twimg.com/profile_images/1417157967124721666/xShJF4Km_400x400.png" width=25 height=25></img> [Docker for the Absolute Beginner - Hands-on](https://gale.udemy.com/course/learn-docker/) | Mumshad Mannambeth, Udemy via S.T.D.L.

### Introduction To Kubernetes
- <img src="https://cdn.iconscout.com/icon/free/png-512/free-linux-foundation-logo-icon-download-in-svg-png-gif-file-formats--technology-social-media-company-brand-vol-4-pack-logos-icons-3031547.png" height=20 width=20></img> [Introduction to Kubernetes (LFS158)](https://training.linuxfoundation.org/training/introduction-to-kubernetes/) | Linux Foundation
- <img src="https://pbs.twimg.com/profile_images/1417157967124721666/xShJF4Km_400x400.png" width=25 height=25></img> [Kubernetes for the Absolute Beginner - Hands-on](https://gale.udemy.com/course/learn-kubernetes/) | Mumshad Mannambeth, Udemy via S.T.D.L.
-  <img src="https://cdn-icons-png.flaticon.com/512/1384/1384060.png" width=20 height=20></img>  [Kubernetes Crash Course for Absolute Beginners - 1 Hour](https://www.youtube.com/watch?v=s_o8dwzRlu4) | TechWorld with Nana, YouTube
-  <img src="https://cdn-icons-png.flaticon.com/512/1384/1384060.png" width=20 height=20></img>  [Kubernetes Tutorial for Beginners - FULL COURSE/4 Hours](https://www.youtube.com/watch?v=X48VuDVv0do) | TechWorld with Nana, YouTube
- 🎓 [Free Kubernetes Training](https://kubecampus.io/) | KubeCampus

### Certified Kubernetes Administrator (CKA)
- <img src="https://cdn.iconscout.com/icon/free/png-512/free-linux-foundation-logo-icon-download-in-svg-png-gif-file-formats--technology-social-media-company-brand-vol-4-pack-logos-icons-3031547.png" height=20 width=20></img> [Certified Kubernetes Administrator (CKA)](https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/) | Linux Foundation
- <img src="https://pbs.twimg.com/profile_images/1417157967124721666/xShJF4Km_400x400.png" width=25 height=25></img> [Certified Kubernetes Administrator (CKA) with Practice Tests](https://gale.udemy.com/course/certified-kubernetes-administrator-with-practice-tests/) | Mumshad Mannambeth, Udemy via S.T.D.L.
- <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbwWJwyGboFanXjneLUsglPpp6iqGYTJktwjPvXIrQ4mO9sqGJuoxdL8Gj1tDfzC2jdC6zE4SzoxBEUiVEla1IihyrnOb8pkrGHBa2ILg" width=20 height=20> [Certified Kubernetes Administrator (CKA)](https://www.cncf.io/training/certification/cka/) | Cloud Native Computing Foundation
-  <img src="https://cdn-icons-png.flaticon.com/512/1384/1384060.png" width=20 height=20></img>  [Everything You Need to Pass the Updated Certified Kubernetes Administrator (CKA) Exam](https://www.youtube.com/watch?v=8VK9NJ3pObU&t=10s) | ASCODE, YouTube
-  <img src="https://cdn-icons-png.flaticon.com/512/1384/1384060.png" width=20 height=20></img>  [Certified Kubernetes Administrator Mock Exam Guide 2023 Parts 1, 2, and 3](https://www.youtube.com/watch?v=w85Cy1pFnZg&t=0s) | Ajeet Khan, YouTube

### Certified Kubernetes Application Developer (CKAD)
- <img src="https://pbs.twimg.com/profile_images/1417157967124721666/xShJF4Km_400x400.png" width=25 height=25></img> [Certified Kubernetes Application Developer (CKAD) with Tests](https://gale.udemy.com/course/certified-kubernetes-application-developer/) | Mumshad Mannambeth, Udemy via S.T.D.L.

### Certified Kubernetes Security Specialist (CKS)
- <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbwWJwyGboFanXjneLUsglPpp6iqGYTJktwjPvXIrQ4mO9sqGJuoxdL8Gj1tDfzC2jdC6zE4SzoxBEUiVEla1IihyrnOb8pkrGHBa2ILg" width=20 height=20> [Certified Kubernetes Security Specialist (CKS)](https://www.cncf.io/training/certification/cks/) | Cloud Native Computing Foundation

### <img src="https://cdn-icons-png.flaticon.com/512/5968/5968906.png" width=20 height=20></img> Thirty Days Of Kubernetes | Vinoth Subbiah, Medium
- [Day 1: Introduction to Kubernetes and Its Architecture](https://medium.com/@vinoji2005/%EF%B8%8F-day-1-introduction-to-kubernetes-and-its-architecture-%EF%B8%8F-58a0f089fc0c)
- [Day 2: Setting Up Kubernetes on macOS, Windows, and Ubuntu](https://medium.com/@vinoji2005/day-2-setting-up-kubernetes-on-macos-windows-and-ubuntu-0aa72967e901)
- [Day 3: Understanding Pods](https://medium.com/@vinoji2005/day-3-understanding-pods-2509000441c9)
- [Day 4: Working with ReplicaSets and Deployments](https://medium.com/@vinoji2005/day-4-working-with-replicasets-and-deployments-50d8b6204a7c)
- [Day 5: Introduction to Services and Networking in Kubernetes](https://medium.com/@vinoji2005/day-5-introduction-to-services-and-networking-in-kubernetes-612432c2e6bf)
- [Day 6: ConfigMaps and Secrets](https://medium.com/@vinoji2005/day-6-configmaps-and-secrets-1d7ff3915abf)
- [Day 7: Namespaces and Resource Quotas](https://medium.com/@vinoji2005/day-7-namespaces-and-resource-quotas-e216b06b44b2)
- [Day 8: Kubernetes Ingress](https://medium.com/@vinoji2005/day-8-kubernetes-ingress-183d2b836438)
- [Day 9: Monitoring and Logging in Kubernetes](https://medium.com/@vinoji2005/day-9-monitoring-and-logging-in-kubernetes-a72c4be852b5)
- [Day 10: Kubernetes CronJobs](https://medium.com/@vinoji2005/day-10-kubernetes-cronjobs-c1bbfef1c98e)
- [Day 11: Kubernetes Security — Role-Based Access Control (RBAC)](https://medium.com/@vinoji2005/day-11-kubernetes-security-role-based-access-control-rbac-e14cdf958819)
- [Day 12: Kubernetes StatefulSets](https://medium.com/@vinoji2005/day-12-kubernetes-statefulsets-f70b4ef98494)
- [Day 13: Kubernetes Network Policies](https://medium.com/@vinoji2005/day-13-kubernetes-network-policies-78337eb42ebc)
- [Day 14: Kubernetes Persistent Volumes and Persistent Volume Claims](https://medium.com/@vinoji2005/day-14-kubernetes-persistent-volumes-and-persistent-volume-claims-5256d2bd7344)
- [Day 15: Kubernetes Load Balancing and Service Types](https://medium.com/@vinoji2005/day-15-kubernetes-load-balancing-and-service-types-07dca9c53291)
- [Day 16: Kubernetes DaemonSets](https://medium.com/@vinoji2005/day-16-kubernetes-daemonsets-f5642346fb3b)
- [Day 17: Kubernetes Jobs and CronJobs](https://medium.com/@vinoji2005/day-17-kubernetes-jobs-and-cronjobs-35549c918340)
- [Day 18: Kubernetes Pod Autoscaling](https://medium.com/@vinoji2005/day-18-kubernetes-pod-autoscaling-efc2be5e9997)
- [Day 19: Kubernetes Ingress Controllers and Ingress Resources for Enterprise Applications](https://medium.com/@vinoji2005/day-19-kubernetes-ingress-controllers-and-ingress-resources-for-enterprise-applications-8335704f4cc0)
- [Day 20: Kubernetes Service Mesh with Istio](https://medium.com/@vinoji2005/day-20-kubernetes-service-mesh-with-istio-09214c5a2917)
- [Day 21: Kubernetes Security Best Practices](https://medium.com/@vinoji2005/day-21-kubernetes-security-best-practices-7c6ff6ff6c24)
- [Day 22: Kubernetes Logging and Monitoring](https://medium.com/@vinoji2005/day-22-kubernetes-logging-and-monitoring-945b6fd79c9f)
- [Day 23: Kubernetes Backup and Disaster Recovery](https://medium.com/@vinoji2005/day-23-kubernetes-backup-and-disaster-recovery-b4b4e470c44c)
- [Day 24: Kubernetes Multi-Cluster Management](https://medium.com/@vinoji2005/day-24-kubernetes-multi-cluster-management-7e53dfe465dd)
- [Day 25: Kubernetes CI/CD Pipelines](https://medium.com/@vinoji2005/day-25-kubernetes-ci-cd-pipelines-a432dfdb6e96)
- [Day 26: Kubernetes Networking and Service Mesh with Istio](https://medium.com/@vinoji2005/day-26-kubernetes-networking-and-service-mesh-with-istio-4beb98c51b60)
- [Day 27: Kubernetes Canary Deployments](https://medium.com/@vinoji2005/day-27-kubernetes-canary-deployments-d52e30706ca5)
- [Day 28: Kubernetes Blue-Green Deployments](https://medium.com/@vinoji2005/day-28-kubernetes-blue-green-deployments-8ae86874268c)
- [Day 29: Kubernetes A/B Testing](https://medium.com/@vinoji2005/day-29-kubernetes-a-b-testing-126f260f7006)
- [Day 30: Kubernetes Performance Tuning and Optimization](https://medium.com/@vinoji2005/day-30-kubernetes-performance-tuning-and-optimization-bcc2a285d060)

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>


## ⚪ Further Study

> Creating the Frontend Service
> 
> The Redis Services you applied is only accessible within the Kubernetes cluster because the default type for a Service is ClusterIP. ClusterIP provides a single IP address for the set of Pods the Service is pointing to. This IP address is accessible only within the cluster.
>
> If you want guests to be able to access your guestbook, you must configure the frontend Service to be externally visible, so a client can request the Service from outside the Kubernetes cluster. However a Kubernetes user can use kubectl port-forward to access the service even though it uses a ClusterIP.

[Creating the Frontend Service](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/#creating-the-frontend-service) | kubernetes.io

> Applications running in a Kubernetes cluster find and communicate with each other, and the outside world, through the Service abstraction. This document explains what happens to the source IP of packets sent to different types of Services, and how you can toggle this behavior according to your needs.

[Using Source IP](https://kubernetes.io/docs/tutorials/services/source-ip/)

<sub><sup>⬆ <a href=#table-of-contents>Table Of Contents</a></sup></sub>

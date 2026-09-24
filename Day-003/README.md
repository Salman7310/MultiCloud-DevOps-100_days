# Day 003 - DevOps Learning Log

## Topics Covered

- AWS fundamentals: what AWS is, its history, and the core services
- Traditional infrastructure vs cloud
- Cloud service models: IaaS, PaaS, SaaS, Serverless (FaaS)
- Cloud deployment types: Public, Private, Hybrid
- Waterfall vs Agile vs DevOps
- The 6 Cs of DevOps and a real CI/CD pipeline
- DevOps roles and skills
- Interview Q&A: basic and scenario-based

## Key Takeaways

### AWS
- **AWS** = Amazon's cloud platform. It gives you servers, storage, networking and databases on demand, and they scale easily.
- AWS has 200+ services, but about **10 core ones** cover most real projects.
- AWS, Azure and GCP offer the same services under different names. Learn one well and you can work in any of them.

| Service | Use |
|---|---|
| EC2 | Virtual machines (front-end, middleware) |
| Lambda | Serverless, event-driven code |
| S3 | Object storage (files, backups, resumes) |
| EBS / EFS | Block disk / shared file system |
| RDS | Managed relational database |
| VPC | Private, isolated network |
| IAM | Users, roles, permissions |
| SQS | Message queue (e.g., triggers Lambda) |

### Traditional → Cloud
- Server room → **EC2 + AMI**
- LAN cables and routers → **VPC**
- Fingerprint door lock → **IAM**
- Pen drive / local disk → **S3 / EBS / EFS**

### Service Models (Pizza Analogy)
| Model | Analogy | You manage | Example |
|---|---|---|---|
| IaaS | Empty flat | OS, runtime, app, data | EC2 |
| PaaS | Kitchen provided | App + data | RDS |
| SaaS | Ready-to-eat pizza | Nothing | Gmail |
| Serverless | Five-star hotel | Only code | Lambda |

- **Lambda** fits event-based or rare jobs: weekly backups, sending email from an SQS queue, converting files to PDF.
- **RDS / EC2** fits continuous workloads. Serverless costs more when the work never stops.
- Other models: FaaS, CaaS (containers), DaaS, STaaS.

### DevOps
- DevOps **automates build → test → deploy** so software ships continuously and with high quality.
- Waterfall gives 1 release in 6 months, Agile about 9, DevOps daily.

**The 6 Cs:** Planning → Integration → Testing → Delivery → Deployment → Monitoring (add Security for DevSecOps)

- **Continuous Delivery** has a manual approval before production (~95% of companies).
- **Continuous Deployment** is fully automatic, with no human gate (~5% of companies).

### CI/CD Pipeline
```
Developer → PR → GitHub → Jenkins (webhook) → Build → Test (Selenium)
→ Docker Image → Kubernetes → Monitoring → Feedback to Developer
```
- **Terraform** provisions the Kubernetes infrastructure.
- **Rollback:** version every build (v1…v4). If v4 fails, redeploy v3, or use a Kubernetes rollback.

### Quick Troubleshooting
- **Jenkins didn't start after a push:** check auth, webhook, trigger config, plugins, logs, repo permissions.
- **Build passed but nothing deployed:** check deploy logs, cluster connectivity, credentials, env vars, the image in the registry.
- **Pods running but the app can't be reached:** check pods, service, endpoints, ingress, container port vs service port.
- **Disk full:** run `df -h` and `du -sh *`, check `/var/log`, then clean up or extend storage.
- **CPU at 90%:** find the root cause, then scale up, optimise the app, or work with the developers.
- **AWS bill spike:** review active resources and billing, and set a **budget alarm**.

### DevOps Roles & Skills
- **Roles:** DevOps, SRE, Cloud, Platform, DevSecOps, Release Engineer. System Administrator is the foundation for all of them.
- **Skills:** Linux/Windows admin, networking, Python/Shell, Docker & Kubernetes, clear communication.

## Resources

- [AWS Console](https://aws.amazon.com/console/)

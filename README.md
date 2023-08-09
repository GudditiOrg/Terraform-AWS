# Aws_Infra

## Major Difference between Terraform vs AWS CloudFormation
<p>Terraform and AWS CloudFormation are both infrastructure as code (IaC) tools used for provisioning and managing resources in cloud environments. They serve similar purposes but have differences in terms of their scope, flexibility, and ecosystem support.</p>
```

| Aspect                   | Terraform                                  | AWS CloudFormation                        |
|--------------------------|--------------------------------------------|-------------------------------------------|
| Language and Syntax      | HCL (HashiCorp Configuration Language)     | JSON or YAML templates                    |
| Multi-Cloud Support      | Supports multi-cloud and on-premises       | Primarily focused on AWS ecosystem        |
| Ecosystem and Resources  | Community modules and providers available  | AWS-specific resources                    |
| Ease of Use              | User-friendly syntax and relatively easy   | Requires JSON/YAML familiarity            |
| State Management         | Utilizes state file for tracking           | Manages state automatically               |
| Updates and Drift        | Provides "plan" feature for change preview | Detects drift and shows differences       |
| Maturity and Adoption    | Widely adopted and established             | Integrated with AWS services              |
| Vendor Lock-In           | Mitigates lock-in with multi-cloud support | AWS-centric, potential for lock-in        |


```

# Auto-Scaling VM Scale Set with Load Balancer

Deploys a highly available, auto-scaling web server infrastructure on Azure using Virtual Machine Scale Sets (VMSS), Load Balancer, and NAT Gateway.

## Architecture
                INTERNET
                    │
                    ▼
          ┌─────────────────┐
          │   Public IP     │
          │   (LB Frontend) │
          └────────┬────────┘
                   │
          ┌────────▼────────┐
          │  Load Balancer  │
          │  - HTTP Probe   │
          │  - Port 80      │
          └────────┬────────┘
                   │
     ┌─────────────┼─────────────┐
     │             │             │
┌────▼────┐   ┌────▼────┐   ┌────▼────┐
│   VM1   │   │   VM2   │   │   VMn   │
│ (Apache)│   │ (Apache)│   │ (Apache)│
└────┬────┘   └────┬────┘   └────┬────┘
     │             │             │
     └─────────────┼─────────────┘
                   │
             ┌─────▼─────┐
             │    NSG    │
             │ (Filtered)│
             └─────┬─────┘
                   │
          ┌────────▼────────┐
          │   NAT Gateway   │
          │ (Outbound Only) │
          └────────┬────────┘
                   │
                   ▼
               INTERNET

               
## Features

- **Auto-Scaling VMSS**
  - Scale out: CPU > 90% → add instance
  - Scale in: CPU < 10% → remove instance
  - Default: 2 instances
  - Range: 1 to 3 instances
  - Cooldown: 1 minute between scaling actions

- **Load Balancing**
  - Standard SKU Load Balancer
  - HTTP health probe on port 80
  - Even traffic distribution across healthy instances

- **Secure Networking**
  - No public IPs on VMs
  - NAT Gateway for controlled outbound access
  - Dynamic NSG rules with default deny policy

- **Environment-Based Sizing**
  - Dev: Standard_B1ms
  - Staging: Standard_B2s
  - Prod: Standard_B2ms

## Prerequisites

| Requirement | Details |
|-------------|---------|
| Azure Subscription | Active subscription with sufficient quota |
| Terraform | Version >= 1.0 |
| Azure CLI | Installed and logged in (`az login`) |
| SSH Key Pair | Public key for VM access |

## Quick Start

bash
# 1. Clone the repository
git clone https://github.com/mshood8701/webser_infra_vmss.git
cd webser_infra_vmss

# 2. Login to Azure
az login
az account set --subscription "YOUR_SUBSCRIPTION_NAME"

# 3. Create terraform.tfvars (see Configuration below)
cp terraform.tfvars.example terraform.tfvars
# Edit with your values

# 4. Initialize Terraform
terraform init

# 5. Review the plan
terraform plan

# 6. Deploy
terraform apply

# 7. Access your application
terraform output application_url
            

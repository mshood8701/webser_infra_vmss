Auto-Scaling VM Scale Set with Load Balancer

This project defines an Azure infrastructure setup designed for scalable and secure backend services. It uses a Virtual Machine Scale Set (VMSS) behind a Load Balancer, with state management in an Azure Storage Account, and implements strict network security and auto-scaling policies.

Architecture Overview

- VM Scale Set (VMSS)

  - Hosts backend servers for the Load Balancer pool.

  - Automatically scales based on CPU utilization:

  - Scale Out: CPU > 80% → add VM

  - Scale In: CPU < 10% → remove VM

  - Default instance count: 2

  - Minimum instances: 1

  - Maximum instances: 3

- Load Balancer & NAT

- Load Balancer distributes traffic across VMSS instances.

- NAT Gateway provides controlled outbound internet access.

- Network Security

- Strict NSG rules allow traffic only from the Load Balancer.

- Dynamic NSG rules are used to simplify configuration and maintenance.

- Resource Management

- Resource Group to organize all related resources.

- Storage Account and Blob Container to manage Terraform backend state.

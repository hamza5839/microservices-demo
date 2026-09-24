# Infrastructure Ownership

This project uses separate ownership boundaries between Terraform and Argo CD.

## Terraform owns

Terraform manages platform/infrastructure resources such as:

- Platform namespaces
- Environment-specific platform configuration
- Infrastructure resources defined under `terraform/`
- Future cloud infrastructure

Terraform state is the source of truth for resources it manages.

## Argo CD owns

Argo CD manages the Online Boutique application:

- Deployments
- Services
- ConfigMaps
- Application configuration
- Application image versions
- Kubernetes manifests under `kubernetes-manifests/`

The GitOps repository is the source of truth for application deployment state.

## Ownership Rule

A Kubernetes resource should have one infrastructure owner.

Terraform must not manage resources already managed by Argo CD.

Argo CD must not manage resources that Terraform exclusively owns.

This prevents Terraform and Argo CD from continuously reconciling the same resource against different desired states.

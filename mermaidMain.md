```mermaid
graph TD;
    A[AWS Provider] -->|Region| B[var.aws_region]

    C[Grafana Module] -->|AMI ID| D[var.grafana_ami_id]
    C -->|Instance Type| E[var.grafana_instance_type]
    C -->|Key Name| F[var.grafana_key_name]
    C -->|Environment| G[var.environment]

    H[MongoDB Module] -->|Project Name| I[var.mongodb_project_name]
    H -->|Atlas Org ID| J[var.mongodb_atlas_org_id]
    H -->|Cluster Name| K[var.mongodb_cluster_name]
    H -->|Region| L[var.aws_region]
    H -->|Username| M[var.mongodb_username]
    H -->|Password| N[var.mongodb_password]
    H -->|Database Name| O[var.mongodb_database_name]

    P[Web App Module] -->|App Bucket Name| Q[var.react_app_bucket_name]
    P -->|Environment| R[var.environment]

    S[Mobile App Module] -->|App Bucket Name| T[var.flutter_app_bucket_name]
    S -->|Environment| U[var.environment]

    V[Backend API Module] -->|API Gateway Name| W[var.api_gateway_name]
    V -->|Lambda Function Name| X[var.lambda_function_name]
    V -->|Environment| Y[var.environment]

mermaid graph TD; A[AWS Provider]:::provider -->|Region| B[var.aws_region]

subgraph Grafana Module
    C1[Grafana]:::module
    C1 -->|AMI ID| D[var.grafana_ami_id]
    C1 -->|Instance Type| E[var.grafana_instance_type]
    C1 -->|Key Name| F[var.grafana_key_name]
    C1 -->|Environment| G[var.environment]
end

subgraph MongoDB Module
    H1[MongoDB]:::module
    H1 -->|Project Name| I[var.mongodb_project_name]
    H1 -->|Atlas Org ID| J[var.mongodb_atlas_org_id]
    H1 -->|Cluster Name| K[var.mongodb_cluster_name]
    H1 -->|Region| L[var.aws_region]
    H1 -->|Username| M[var.mongodb_username]
    H1 -->|Password| N[var.mongodb_password]
    H1 -->|Database Name| O[var.mongodb_database_name]
end

subgraph Web App Module
    P1[Web App]:::module
    P1 -->|App Bucket Name| Q[var.react_app_bucket_name]
    P1 -->|Environment| R[var.environment]
end

subgraph Mobile App Module
    S1[Mobile App]:::module
    S1 -->|App Bucket Name| T[var.flutter_app_bucket_name]
    S1 -->|Environment| U[var.environment]
end

subgraph Backend API Module
    V1[Backend API]:::module
    V1 -->|API Gateway Name| W[var.api_gateway_name]
    V1 -->|Lambda Function Name| X[var.lambda_function_name]
    V1 -->|Environment| Y[var.environment]
end

classDef provider fill:#f9f,stroke:#333,stroke-width:2px;
classDef module fill:#bbf,stroke:#333,stroke-width:2px;

output "connection_string" {
  value = mongodbatlas_cluster.cluster.connection_strings[0].standard
}

output "cluster_id" {
  value = mongodbatlas_cluster.cluster.cluster_id
}
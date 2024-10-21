variable "project_name" {
  description = "The name of the MongoDB Atlas project"
  type        = string
}

variable "atlas_org_id" {
  description = "The organization ID for MongoDB Atlas"
  type        = string
}

variable "cluster_name" {
  description = "The name of the MongoDB cluster"
  type        = string
}

variable "region" {
  description = "The region where the cluster will be created"
  type        = string
}

variable "db_username" {
  description = "The username for the MongoDB database"
  type        = string
}

variable "db_password" {
  description = "The password for the MongoDB database"
  type        = string
}

variable "database_name" {
  description = "The name of the database to create"
  type        = string
}
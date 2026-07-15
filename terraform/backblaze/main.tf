terraform {
  required_version = ">= 1.0.0"
  required_providers {
    b2 = {
      source = "Backblaze/b2"
    }
  }
}

provider "b2" {
}

resource "b2_bucket" "etcd_bucket" {
  bucket_name = "k3s-home-etcd-backup"
  bucket_type = "allPrivate"

  default_server_side_encryption {
    algorithm = "AES256"
    mode      = "SSE-B2"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "b2_application_key" "k3s_etcd_backup_key" {
  key_name = "etcd-backup-key"
  bucket_ids = [b2_bucket.etcd_bucket.id]

  capabilities = [
    "readFiles",
    "writeFiles",
    "deleteFiles",
    "listAllBucketNames"
  ]
}

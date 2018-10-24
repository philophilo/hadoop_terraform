provider "google"{
    credentials     = "${var.service_account_path}"
    project         = "${var.gcloud_project}"
    region          = "${var.gcloud_region}"
}

terraform {
    backend "gcs" {}
}

data "terraform_remote_state" "hadoop" {
    backend         = "gcs"
    config{
        bucket      = "${var.bucket}"
        prefix      = "${var.prefix}"
        project     = "${var.gcloud_project}"
        credentials = "${var.service_account_path}"
    }
}

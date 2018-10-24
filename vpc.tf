resource "google_compute_network" "vpc" {
    name                    = "${var.platform_name}-vpc"
    description             = "Virtual Private Cloud for the ${var.project_description}"
    auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "private_network"{
    name                    = "${var.platform_name}-private"
    description             = "Private subnet for {var.project_description}"
    ip_cidr_range           = "${lookup(var.subnet_cidrs, "private")}"
    network                 = "${google_compute_network.vpc.self_link}"
}

resource "google_compute_subnetwork" "public_network"{
    name                    = "${var.platform_name}-public"
    description             = "Public subnet for {var.project_description}"
    ip_cidr_range           = "${lookup(var.subnet_cidrs, "public")}"
    network                 = "${google_compute_network.vpc.self_link}"
}

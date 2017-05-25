#####################################################################
# Disks
#####################################################################
resource "google_compute_disk" "data1" {  
    name  = "data1"
    type  = "pd-ssd"
    zone  = "asia-southeast1"
    //snapshot = "blog-2017-02-09-1"
    size = 10
}

#####################################################################
# VM Instances
#####################################################################
resource "google_compute_instance" "data1" {  
    name = "data1"
    machine_type = "f1-micro"
    zone = "${google_compute_disk.data1.zone}"

    tags = ["http"]

    disk {
        disk = "${google_compute_disk.data1.name}"
        auto_delete = true
    }

    network_interface {
        network = "default"
        access_config {
            # ephemeral external ip address
        }
    }

    metadata {
    }

    service_account {
        scopes = ["https://www.googleapis.com/auth/servicecontrol",
                  "https://www.googleapis.com/auth/service.management.readonly",
                  "https://www.googleapis.com/auth/logging.write",
                  "https://www.googleapis.com/auth/monitoring.write",
                  "https://www.googleapis.com/auth/trace.append",
                  "https://www.googleapis.com/auth/devstorage.read_only",
                  "https://www.googleapis.com/auth/cloud.useraccounts.readonly"]
    }

    scheduling {
        preemptible = false
        on_host_maintenance = "MIGRATE"
        automatic_restart = true
    }

    provisioner "remote-exec" {
        inline = [
            "echo 'hello from $HOSTNAME' > ~/terraform_complete"
        ]
        connection {
            type = "ssh"
            user = "ubuntu",
            private_key = "${file("~/.ssh/google_compute_engine")}"
        }
    }
}

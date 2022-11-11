data "kubermatic_project" "adorsys" {
  name = var.kubermatic_project
}

resource "kubermatic_cluster" "example" {
  project_id = data.kubermatic_project.adorsys.id
  name       = "example"
  dc_name    = "eu-west-1"

  spec {
    version = "1.22.5"
    cloud {

      aws {
        # lacking AWS CREDENTIALS
        # we won't provide these here
        # using a credentialsset like in the ui is not possible atm
        # using a clustertemplate is also not possible atm
        instance_profile_name = "example-profile-name"
      }

      dc = "aws-eu-central-1a"
    }
  }
}

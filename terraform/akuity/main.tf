terraform {
  required_providers {
    akp = {
      source  = "akuity/akp"
      version = ">= 0.1.0"
    }
  }
}

provider "akp" {
  # The organization name is required.
  # You will need to replace "your-org-name" with your actual Akuity organization name.
  org_name = "akuity"

  # API Key ID and Secret should be configured using environment variables:
  # export AKUITY_API_KEY_ID="your-api-key-id"
  # export AKUITY_API_KEY_SECRET="your-api-key-secret"
}

# Example: Data source to fetch organization details
data "akp_instance" "current" {
  name = "default" # Usually "default" for the main instance
}

output "akuity_instance_id" {
  description = "The ID of the Akuity instance."
  value       = data.akp_instance.current.id
}

output "akuity_instance_url" {
  description = "The URL of the Akuity instance."
  value       = data.akp_instance.current.url
}

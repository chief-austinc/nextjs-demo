terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  api_token = "0vxMG-gmaaQI7gvTEnkmt0PSmuC0uUgj11yQ61UU"
}

resource "cloudflare_pages_project" "build_config" {
  account_id        = "ace4aa22fec291d6ac87b4a9a4658fbf"
  name              = "next-js-demo-austin"
  production_branch = "main"

  build_config {
    build_command       = "npm run build:app"
    destination_dir     = "out"
    root_dir            = "/"
    # web_analytics_tag   = "cee1c73f6e4743d0b5e6bb1a0bcaabcc"
    # web_analytics_token = "021e1057c18547eca7b79f2516f06o7x"
  }

  source {
    type = "github"
    config {
      owner                         = "chief-austinc"
      repo_name                     = "nextjs-demo"
      production_branch             = "main"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "custom"
      preview_branch_includes       = ["dev", "preview"]
      preview_branch_excludes       = ["main", "prod"]
    }
  }

  deployment_configs {
    preview {
      environment_variables = {
        ENVIRONMENT = "preview"
      }
      compatibility_date  = "2022-08-15"
      compatibility_flags = ["preview_flag"]
    }
    production {
      environment_variables = {
        ENVIRONMENT = "production"
        OTHER_VALUE = "other value"
      }
      compatibility_date  = "2022-08-16"
      compatibility_flags = ["production_flag", "second flag"]
    }
  }
}
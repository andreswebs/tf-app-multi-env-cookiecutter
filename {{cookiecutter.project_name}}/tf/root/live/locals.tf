locals {
  default_tags = {
    Application = "{{ cookiecutter.project_name }}"
    Environment = "live"
    CreatedWith = "terraform"
    Repository  = ""
  }
}

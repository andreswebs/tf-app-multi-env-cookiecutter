locals {
  default_tags = {
    Application = "{{ cookiecutter.project_name }}"
    Environment = "dev"
    CreatedWith = "terraform"
    Repository  = ""
  }
}

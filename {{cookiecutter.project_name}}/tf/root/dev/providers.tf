variable "aws_region" {
  type    = string
  default = "{{ cookiecutter.aws_region }}"
}

provider "aws" {
  region = var.aws_region
{%- if cookiecutter.iam_role_arn_dev %}

  assume_role {
    role_arn = "{{ cookiecutter.iam_role_arn_dev }}"
  }
{%- endif %}

  default_tags {
    tags = local.default_tags
  }
}

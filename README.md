# tf-app-multi-env-cookiecutter

[Cookiecutter](https://www.cookiecutter.io/) template to generate boilerplate for an application to be deployed as a multi-environment Terraform project.

## Pre-requisites

Install [cookiecutter](https://cookiecutter.readthedocs.io/en/stable).

I recommend using [uv](https://docs.astral.sh/uv/) to manage the Python environment. Below is one way to get started for [Homebrew](https://brew.sh) users. Follow the [cookiecutter installation instructions](https://cookiecutter.readthedocs.io/en/stable/installation.html) for other methods.

```sh
brew install uv
```

```sh
uv tool install cookiecutter
```

Install [terraform-docs](https://terraform-docs.io/). Generation refuses to start without it, since the generated pre-commit hook depends on it.

```sh
brew install terraform-docs
```

## Run

```sh
cookiecutter gh:andreswebs/tf-app-multi-env-cookiecutter
```

## Configurations

| Variable                 | Default                           | Description                                                                                      |
| ------------------------ | --------------------------------- | ------------------------------------------------------------------------------------------------ |
| `project_name_full`      | `__REPLACE_ME_project-name`       | Human-readable project name.                                                                     |
| `project_name`           | derived from `project_name_full`  | Lowercased, hyphenated slug. Used for the directory name, state key and `Application` tag.      |
| `author_name`            | empty                             | Shown in the generated README.                                                                   |
| `author_handle`          | empty                             | Shown in the generated README.                                                                   |
| `author_link`            | empty                             | Link target for the author handle in the generated README.                                      |
| `tfstate_bucket`         | `__REPLACE_ME_tfstate-bucket`     | S3 bucket holding the Terraform state for both environments.                                     |
| `tfstate_kms_key_name`   | `__REPLACE_ME_key-name`           | KMS key alias (without the `alias/` prefix) used to encrypt the state.                          |
| `aws_region`             | `us-east-1`                       | Region for the state bucket and the default for the `aws_region` Terraform variable.            |
| `aws_account_alias_dev`  | `__REPLACE_ME_account-alias-dev`  | First segment of the dev state key.                                                              |
| `aws_account_alias_live` | `__REPLACE_ME_account-alias-live` | First segment of the live state key.                                                             |
| `iam_role_arn`           | `__REPLACE_ME_role-arn`           | Role assumed by the S3 backend in both environments.                                             |
| `iam_role_arn_dev`       | empty                             | Role assumed by the AWS provider in dev. When empty, no `assume_role` block is rendered.         |
| `iam_role_arn_live`      | empty                             | Role assumed by the AWS provider in live. When empty, no `assume_role` block is rendered.        |
| `git_init`               | `true`                            | Run `git init` and install the pre-commit hook after generation.                                 |

The state key for each environment is `<account alias>/<project_name>/<aws_region>/terraform.tfstate`.

Each root module applies `default_tags` from its `locals.tf`. The `Repository` tag is left empty for you to fill in after generation.

## Structure

This cookiecutter will generate the following project skeleton:

```txt
.
├── .editorconfig
├── .envrc
├── .git-hooks
│   └── pre-commit
├── .gitattributes
├── .gitignore
├── .ls-lint.yml
├── .terraform-docs.yml
├── .tflint.hcl
├── README.md
└── tf
    ├── modules
    │   └── .gitkeep
    └── root
        ├── dev
        │   ├── backend.tf
        │   ├── dev.s3.tfbackend
        │   ├── locals.tf
        │   ├── main.tf
        │   ├── outputs.tf
        │   ├── providers.tf
        │   ├── README.md
        │   ├── variables.tf
        │   └── versions.tf
        └── live
            ├── backend.tf
            ├── live.s3.tfbackend
            ├── locals.tf
            ├── main.tf
            ├── outputs.tf
            ├── providers.tf
            ├── README.md
            ├── variables.tf
            └── versions.tf
```

## Authors

**Andre Silva** - [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE).

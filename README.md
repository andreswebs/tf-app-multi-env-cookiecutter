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

## Run

```sh
cookiecutter gh:andreswebs/tf-app-multi-env-cookiecutter
```

## Configurations

See the configuration options in [cookiecutter.json](cookiecutter.json).

## Structure

This cookiecutter will generate the following project skeleton:

```txt
.
├── .editorconfig
├── .envrc
├── .git-hooks
│   └── pre-commit
├── .gitignore
├── .ls-lint.yml
├── .terraform-docs.yml
├── .tflint.hcl
└── tf
    ├── modules
    │   └── .gitkeep
    └── root
        ├── dev
        │   ├── backend.tf
        │   ├── dev.s3.tfbackend
        │   ├── main.tf
        │   ├── outputs.tf
        │   ├── providers.tf
        │   ├── README.md
        │   ├── variables.tf
        │   └── versions.tf
        └── live
            ├── backend.tf
            ├── live.s3.tfbackend
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

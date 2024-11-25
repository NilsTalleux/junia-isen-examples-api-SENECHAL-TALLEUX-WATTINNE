# Examples API

Simple API that returns example records from a database.

## Made by
* Pierre SENECHAL
* Nils TALLEUX
* Benoît WATTINNE

## Prerequisites

You need to install:
- [Azure Cli](https://learn.microsoft.com/fr-fr/cli/azure/install-azure-cli-windows)
- [Terraform](https://developer.hashicorp.com/terraform/install)
- [uv](https://docs.astral.sh/uv/guides/install-python/)
- you must have a PostgreSQL instance available with an `example` table

## Run the infrastructure

See [here](https://github.com/NilsTalleux/junia-isen-examples-api-SENECHAL-TALLEUX-WATTINNE/blob/main/infrastructure/README.md)

## Installation

```shell
# Install Python in the right version
uv python install

# Install dependencies and create virtual env
uv sync
```

## Run

```shell
# Export environment variables to connect to the PostgreSQL database...
export DATABASE_HOST=
export DATABASE_PORT=
export DATABASE_NAME=
export DATABASE_USER=
export DATABASE_PASSWORD='' # Use single quotes to avoid shell interpolation with characters like $ or #
# ...and the storage account
export STORAGE_ACCOUNT_URL=

# Run the application
uv run fastapi dev examples/examples.py
```

## Run tests

```
uv run pytest tests/
```

They go on:

- http://localhost:8000/docs
- http://localhost:8000/
- http://localhost:8000/examples

# Infrastructure

This Terraform project is structured to provide a modular and organized approach to deploying cloud infrastructure.

## **Files**

- **`main.tf`**:  
  Contains the primary code for configuring and orchestrating the infrastructure, including module instantiations and global resource definitions.

- **`variables.tf`**:  
  Defines input variables that make the configuration flexible and reusable across environments.

- **`outputs.tf`**:  
  Specifies the outputs of the Terraform project, providing important resource information after the deployment.

---

## **Modules**

The project is modularized for better scalability and maintainability. Each module encapsulates the resources related to a specific functionality.

- **`app_service`**:  
  Manages the deployment and configuration of the application service (e.g., API).

- **`database`**:  
  Handles the setup and configuration of Postgres database resources.

- **`resource_group`**:  
  Defines the resource group to logically organize cloud resources.

- **`storage`**:  
  Implements blob storage for storing JSON data file.

- **`vnet`**:  
  Configures the virtual network (VNet) and related networking resources.


# Limitation

During this project, restrictions (Junia) and also errors linked to the firewall disrupted the creation of resources with Azure.
The Python tests are carried out with workflows but concerning Docker, it is impossible for us to check if it works or not.
In addition, at the very beginning, a commit did not respect the karma standard, to respect this standard the commit was modified, which impacted all the following commits which were linked into a block.

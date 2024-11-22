# Examples API

Simple API that returns example records from a database.

## Group
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

# Documention

Lors de ce projet des restrictions (Junia) et aussi des erreurs liées au firewall on perturbé la création de ressources auprès d'azure.
Les tests pythons sont réalisés mais pour ce qui concerne docker impossible pour nous de vérifier si cela fonctionne où non.
De plus, au tout début un commit ne respectait pas la norme karma, pour respecter cette norme le commit a été modifié, ce qui a impacté tous les commits suivants qui ont été reliés en un bloc.

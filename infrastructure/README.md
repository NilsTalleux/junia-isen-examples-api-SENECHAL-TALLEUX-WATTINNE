## Run the infrastructure

# Prerequisites

Make sure you have terraform installed (you can check with `terraform -version`).

Get your azure login with `az login` (Make sure you have Azure CLI installed).


# Create the tfvars file

Take inspiration from the `terraform.tfvars.example` file and create a file *in the infrastructure folder* named `terraform.tfvars` and put your Azure ID inside.
The file (`terraform.tfvars`) should look like this:
```
subscription_id         = ""                        # Azure subscription ID. Use 'az login' command to get it.
resource_group_name     = "Cloud-Computing-Project" # Optional: name of the resource group (default: Cloud-Computing-Project)
resource_group_location = "France Central"          # Optional: Resource group location (default: France Central)

github_handle           = ""                        # Your GitHub username
email_address           = "@*.junia.com"            # Junia email address

# Only contain alphanumeric characters and dashes,
# up to 60 characters in length and MUST BE UNIQUE
# More info: https://learn.microsoft.com/en-us/answers/questions/1150735/app-service-name-is-not-available-only-for-some-te?orderBy=Newest
app_service_name        = "linuxwebapppcntbw"       # Optional: name of the app-service
storage_account_name    = "storageaccountccppsntbw" # Optional : name of the Storage Account (MUST BE UNIQUE)

db_server_name          = "ccproject-psntbw"        # Name of the PostgreSQL server (MUST BE UNIQUE)
db_admin_username       = "adm"                     # Admin username for the PostgreSQL server
db_admin_password       = "notasafepasswd"          # Admin password for the PostgreSQL server
db_name                 = "mySuperDatabase"         # Optional : database name

storage_container_name  = "storageccppsntbw"        # Optional : name of the Storage Container within the Storage Account
```


# Run terraform

Inside the infrastructure folder, run the following commands:
```bash
terraform init
terraform validate
terraform plan
```

Then, you can run:
```bash
terraform apply
```


# Remove

to delete generated components:
```bash
terraform destroy
```



# Issues : 

Due to some restrictions on my firewall, even when deactivating it, i had an error saying connection reset "nill" and was unable to create anything on azure for most of the project.
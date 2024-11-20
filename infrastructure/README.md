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

# Only contain alphanumeric characters and dashes,
# up to 60 characters in length and MUST BE UNIQUE
# More info: https://learn.microsoft.com/en-us/answers/questions/1150735/app-service-name-is-not-available-only-for-some-te?orderBy=Newest
app_service_name        = "LinuxWebApppcntbw"       # Optional: name of the app-service
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
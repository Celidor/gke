# gke
* Google Kubernetes Engine deployed using Terraform
* For use with learnsecurity lab guide

## set up project and credentials
* create GCP project
* create terraform service account with Project Owner role
* download keys, save and include path to file in bash profile, e.g.
```
export GOOGLE_CLOUD_KEYFILE_JSON="/Users/username/gcp/serviceaccount.json"
```
* start new shell
* enable compute-engine API using GCP console
* duplicate the terraform.tfvars.example file
* rename without the .example suffix and enter your GCP project name

## requirements
* Terraform v 0.14.x

## deploy

```
terraform init
terraform workspace new dev
terraform plan
terraform apply
```

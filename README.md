# Cloud-Platform-Asset-Inventory
Dynamic asset inventory collection for different cloud platforms - AWS, Azure, GCP using Ansible

#Create .credentials folder as follows :
➜  Cloud-Platform-Asset-Inventory git:(main) cd .credentials 
➜  .credentials git:(main) tree
.
├── aws
│   └── credentials
├── azure
│   └── credentials
└── gcp
    └── application_default_credentials.json

Add credentials for aws, azure and gcp within their respective credentials file. 
AWS :
[default]
aws_access_key_id=<aws_access_key_id>
aws_secret_access_key=<aws_secret_access_key>

Azure:
[default]
client_id=<client_id>
secret=<secret>
subscription_id=<subscription_id>
tenant=<tenant>
 
GCP:
{
  "type": "<Account_type>",
  "project_id": "<project_id>",
  "private_key_id": "<private_key_id>",
  "private_key": "<private_key>"
  "client_email": "<client_email>",
  "client_id": "<client_id>",
  "auth_uri": "<auth_uri>",
  "token_uri": "<token_uri>",
  "auth_provider_x509_cert_url": "<auth_provider_x509_cert_url>",
  "client_x509_cert_url": "<client_x509_cert_url>"
}

# Build and run the container as follows:
docker-compose up --build

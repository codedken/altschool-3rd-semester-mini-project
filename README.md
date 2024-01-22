# ALT-SCHOOL 3RD SEMESTER MINI PROJECT
## Using Terraform to Create 3 EC2 Instance with a Load Balancer behind them

### About Project
Using Terraform,

- Create 3 EC2 Ubuntu-based Instances 
- Create a Load balancer and put the instances behind it
- Make sure to create a file called host-inventory with the public IP addresses of Instances saved as its content
- Create a custom domain name and point it to the IP address of the Elastic Load Balancer (ELB) such that when your enter "terraform-test.yourdomainname" it will randomly display the contents (Ip address) of the instances.
- Create an ansible script that uses the host-inventory file terraform created to install apache and set the timezone to Africa/Lagos, and displays a simple HTML page that shows the contents to clearly identify on all 3 EC2 instances.

### Requirements to use this project
- A well functioning PC with a good internet connection
- An AWS account
- Install and configure git and terraform
- Install aws cli and run `aws configure` to set your aws access_key, secret_key.
- Create a key pair on the EC2 section on your AWS console.

### How to utilize this project

1) Open a CLI (gitbash preffered) Clone this repo and cd into the just cloned directory
2) Open variables.tf file and replace the values with your own values
3) Run `terraform init` to download and install the resources needed to run the terraform configuration
4) Run `terraform plan` to see a preview of the resources that are about to be created on aws
5) Run `terraform apply` to effect the planned changes
6) Add the key pair (.pem file) to ansible-playbook directory and open the ansible.cfg to replace the private_key_file parameter with the your key pair file location.
7) While on the ansible-playbook directory, run the ansible script on a linux machine (You can do that from a virtual machine, or create a host instance on your AWS console)
8) Ensure your custom domain nameservers equals the value of the nameservers that appears on your custom domain on your load balancer created with terraform.
9) If everything works fine, you should be able to access your instances using [terraform-test.yourcustomdomain]()

**Note:** Ensure to run project for a region with a minimum of 3 availability zones.

### Happy deployment !!!
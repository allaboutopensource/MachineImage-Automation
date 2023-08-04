# Packer-Terraform
Image automation using packer tool for AMI, ansible for provisioning the software and terraform for provisioning the machines.

You need to have roles specified which are for particular software like java role (Installing java on the machine) that you want to install on your image.

In this we have mentioned few roles like Git, java, Apache, Bigfix , Nagios role for installing these software on the golden image.

You need to have a private-key.pem and the ansible playbook that wanna run stored in the local machine where you are running this script.
<img width="1074" alt="image" src="https://github.com/allaboutopensource/MachineImage-Automation/assets/5890851/0a040bdc-11c4-4548-a808-8ff090e9ab07">

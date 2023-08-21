## AWS

chmod 400 linuxDemo.pem
ssh -i "linuxDemo.pem" ec2-user@ec2-54-160-123-128.compute-1.amazonaws.com

#Create an EC2 instance with Amazon Linux 2 with internet access
#Connect to your instance using putty

    sudo yum update -y          -->> Perform a quick update on your instance:
    sudo yum install git -y     -->> Install git in your EC2 instance
    git version                 -->> Check git version


    sudo yum install python3 -y     -->> Install python3 in your EC2 instance

Instalation of Anaconda:

## GCP (Google Cloud Platform):

-   `$ gcloud help config`

-   `$ gcloud projects list`
    -->> will list the projects running on my account
-   `$ gcloud config set project my-project`

export IMAGE_FAMILY="pytorch-latest-gpu" # or "pytorch-latest-cpu" for non-GPU instances
export ZONE="us-central1-f"
export INSTANCE_NAME="my-fastai-instance"
export INSTANCE_TYPE="n1-highmem-8" # budget: "n1-highmem-4"

# budget: 'type=nvidia-tesla-t4,count=1'

```bash
gcloud compute instances create $INSTANCE_NAME \
    --zone=$ZONE \
    --image-family=$IMAGE_FAMILY \
    --image-project=deeplearning-platform-release \
    --maintenance-policy=TERMINATE \
    --accelerator="type=nvidia-tesla-p100,count=1" \
    --machine-type=$INSTANCE_TYPE \
    --boot-disk-size=200GB \
    --metadata="install-nvidia-driver=True" \
    --preemptible
```

```bash
gcloud compute instances create ds
    --project=data-science-330201
    --zone=us-east1-b
    --machine-type=e2-medium
    --network-interface=network-tier=PREMIUM,subnet=default
    --maintenance-policy=TERMINATE
    --service-account=498106001917-compute@developer.gserviceaccount.com
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append
    --tags=http-server,https-server
    --create-disk=auto-delete=yes,boot=yes,device-name=ds,image=projects/ubuntu-os-cloud/global/images/ubuntu-1604-xenial-v20210928,mode=rw,size=10,type=projects/data-science-330201/zones/us-east1-b/diskTypes/pd-balanced
    --no-shielded-secure-boot
    --shielded-vtpm
    --shielded-integrity-monitoring
    --reservation-affinity=any`
```

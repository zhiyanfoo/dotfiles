gcloud compute instances create cilium-dev-vagrant \
  --machine-type=n2-highcpu-64 \
  --preemptible \
  --no-restart-on-failure \
  --maintenance-policy=terminate \
  --image-family=ubuntu-2004-lts \
  --image-project=ubuntu-os-cloud \
  --enable-nested-virtualization \
  --boot-disk-size=200GB

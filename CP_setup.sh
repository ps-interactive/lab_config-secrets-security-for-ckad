# Based on scripts from the Pluralsight course
# Kubernetes Installation and Configuration Fundamentals by Anthony Nocentino

#Create our kubernetes cluster, specify a pod network range matching that in calico.yaml! 
#Only on the Control Plane Node, download the yaml files for the pod network.
wget https://raw.githubusercontent.com/projectcalico/calico/master/manifests/calico.yaml


#You can now just use kubeadm init to bootstrap the cluster
sudo kubeadm init --kubernetes-version v1.29.1

#Configure our account on the Control Plane Node to have admin access to the API server from a non-privileged account.
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


#1 - Creating a Pod Network
#Deploy yaml file for your pod network.
kubectl apply -f calico.yaml

#!/bin/bash
set -E

k8schk () {
chkube=`kubectl get nodes`
chkubes="$?"
chk8s=`kubectl config get-contexts -o name`
chk8ss="$?"


if [[ (( $chkubes -ne 0 )) || (( $chk8ss -ne 0 )) ]]
then
	echo "k8s in not installed or running exiting install"
	exit
else
	echo "k8s installed proceeding with Argo CD installation"
fi

}


installargo () {

insarg1=`kubectl create namespace argocd`
insarg2=`kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml`

argochk=`which argocd`
argochks="$?"
if [[ (( $argochks -ne 0 )) ]]
then
insarg3=`sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64`
insarg4=`sudo chmod +x /usr/local/bin/argocd`
fi

}



k8schk

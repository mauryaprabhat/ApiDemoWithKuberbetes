Prabhat api is demo application for learning containerization with docker and deployment using kubenetes on local system. 

docker run -p 80:80 image_name -> for port forwarding.
docker image build -t mauryaprabhat2/prabhatapi:v1.1 . -> docker image build with tag and username of docker hub.
docker image push mauryaprabhat2/prabhatapi:v1.1 -> push docker image on docker hub.
kubectl apply -f deployment.yaml -n prabhatns -> create deployments.
kubectl delete -f deployment.yaml -n prabhatns -> delete deployments.
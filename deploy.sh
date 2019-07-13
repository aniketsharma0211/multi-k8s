docker build -t aniketsharma0211/multi-client:latest -t aniketsharma0211/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t aniketsharma0211/multi-server:latest -t aniketsharma0211/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t aniketsharma0211/multi-worker:latest -t aniketsharma0211/multi-worker:$SHA -f ./worker/Dockerfile ./worker


docker push aniketsharma0211/multi-client:latest
docker push aniketsharma0211/multi-client:$SHA
docker push aniketsharma0211/multi-server:latest
docker push aniketsharma0211/multi-server:$SHA
docker push aniketsharma0211/multi-worker:latest
docker push aniketsharma0211/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image Deployment/client-deployment client=aniketsharma0211/multi-client:$SHA
kubectl set image Deployment/server-deployment server=aniketsharma0211/multi-server:$SHA
kubectl set image Deployment/worker-deployment worker=aniketsharma0211/multi-worker:$SHA
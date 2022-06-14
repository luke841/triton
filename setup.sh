# Create the models and build the containers.
docker build -t tensorrt-conversion-manager -f Dockerfile.converter .
docker run -v $pwd/server/plugins/:/plugins -v $pwd/server/model_repository:/models --gpus '"device=0"' --rm -t tensorrt-conversion-manager:latest
docker build -t tritonserver:latest .
docker run -it tritonserver:latest

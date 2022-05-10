# See Dockerfile.compose for building this base image
FROM tritonserver-custom

# Format models for Triton Server
COPY server/model_repository /models

# Format SO for Triton Server
COPY server/plugins /plugins

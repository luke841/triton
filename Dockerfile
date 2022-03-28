FROM nvcr.io/nvidia/tritonserver:21.12-py3

# Format models for Triton Server
COPY server/model_repository /models

# Format SO for Triton Server
COPY server/plugins /plugins

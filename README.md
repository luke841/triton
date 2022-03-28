# Triton Public
Sets up a Triton inference server and sets up a Yolov5 engine file specific 
to the clients GPU architecture. The Object detection model can then be 
served via a gRCP request. 

Attribution
---
The following libraries are used in this project. Please see licenses with respect to attribution. 
- Triton: https://github.com/triton-inference-server/server
- Yolov5: https://github.com/ultralytics/yolov5
- TensorRTx: https://github.com/wang-xinyu/tensorrtx


Setup 
---
To set up, call  
`bash setup.sh`

This will run the conversion tool under `tensorrt_conversion_manager` 
The `tensorrt_conversion_manager` will create a Yolov5 engine file and a .so
file that is bound to the given computers GPU and as such can be executed
faster than an unoptimised model.  

Once the `tensorrt_conversion_manager` is complete, it will stop the container 
and laod the triton inference server with the engine model ready for inference.

Per the Triton Inference Server documentation, the Triton server can be queried
on ports.
- 8000: HTTP
- 8001: gRCP

For an example on creating a client, see the Triton inference server at
https://github.com/triton-inference-server/client

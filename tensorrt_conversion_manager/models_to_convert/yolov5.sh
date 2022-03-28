#!/bin/bash
# Download Yolov5 and Conversion repos
git clone -b v6.0 https://github.com/ultralytics/yolov5.git
git clone https://github.com/wang-xinyu/tensorrtx.git

# Download model
wget https://github.com/ultralytics/yolov5/releases/download/v6.0/yolov5s.pt -P /workspace/yolov5 -O /workspace/yolov5/yolov5s.pt

# Creates wts file from pytorch model
cp tensorrtx/yolov5/gen_wts.py yolov5
cd /workspace/yolov5
python /workspace/yolov5/gen_wts.py -w /workspace/yolov5/yolov5s.pt -o /workspace/yolov5/yolov5s.wts
cd /workspace/tensorrtx/yolov5

# Create the conversion tool
rm -rf /workspace/tensorrtx/yolov5/build
mkdir -p /workspace/tensorrtx/yolov5/build
cp /workspace/yolov5.cpp /workspace/tensorrtx/yolov5/yolov5.cpp

cd /workspace/tensorrtx/yolov5/build
cp /workspace/yolov5/yolov5s.wts /workspace/tensorrtx/yolov5/build
cmake ..
make -j8

# Create the engine and save to the server model folder for inference
mkdir -p /models/yolov5-tensorrt/1/
/workspace/tensorrtx/yolov5/build/yolov5 -s /workspace/tensorrtx/yolov5/build/yolov5s.wts /models/yolov5-tensorrt/1/model.plan s 4 0 0.001 1
cp /workspace/tensorrtx/yolov5/build/libmyplugins.so /plugins/libmyplugins.so
exec "$@"

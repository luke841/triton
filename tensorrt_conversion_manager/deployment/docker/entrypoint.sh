#!/bin/bash
if ! [[ -n $(find /models -name *.plan) ]]
then
  ./models_to_convert/yolov5.sh
else
  echo Model already exists. Skipping startup
fi

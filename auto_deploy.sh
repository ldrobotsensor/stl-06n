#!/bin/bash
#Author: David Hu
#Date: 2022-10
set -e

FEATURE_NUMBER_BETA=0
FEATURE_NUMBER_STABLE=1

echo ">>Ready to pack"
echo "Generate pack Style: sdk_ldrobotsensorteam_<product line number>_<sdk version>_<publishing feature>_<packet times>.zip"
read -p "Please input product line number (eg: stl):" PRODUCT_LINE_TYPE
read -p "Please input sdk version(eg: v1.0.0):"  SDK_VERSION
read -p "Please input publishing feature number[beta(0) or stable(1)]:" PUBLISH_FEATURE_NUMBERS

echo ">>Start to Pack"
if [ ${PUBLISH_FEATURE_NUMBERS} == ${FEATURE_NUMBER_BETA} ];then
  FLODER_NAME="sdk_ldrobotsensorteam_${PRODUCT_LINE_TYPE}_${SDK_VERSION}_beta_`date +%Y%m%d-%H-%M`"
  mkdir ${FLODER_NAME}
  cp ./*.md ./${FLODER_NAME}
  cp ./LICENSE ./${FLODER_NAME}
  cp ./ldlidar_driver ./${FLODER_NAME} -a
  cp ./linux_app ./${FLODER_NAME} -a
  cp ./ros_app ./${FLODER_NAME} -a
  cp ./ros2_app ./${FLODER_NAME} -a
  zip -r ${FLODER_NAME}.zip ./${FLODER_NAME}
  echo "Create a ${FLODER_NAME}.zip"
  rm -rf ./${FLODER_NAME}
  echo "Del ./${FLODER_NAME} "
elif [ ${PUBLISH_FEATURE_NUMBERS} == ${FEATURE_NUMBER_STABLE} ];then
  FLODER_NAME="sdk_ldrobotsensorteam_${PRODUCT_LINE_TYPE}_${SDK_VERSION}_stable_`date +%Y%m%d-%H-%M`"
  mkdir ${FLODER_NAME}
  cp ./*.md ./${FLODER_NAME}
  cp ./LICENSE ./${FLODER_NAME}
  cp ./ldlidar_driver ./${FLODER_NAME} -a
  cp ./linux_app ./${FLODER_NAME} -a
  cp ./ros_app ./${FLODER_NAME} -a
  cp ./ros2_app ./${FLODER_NAME} -a
  zip -r ${FLODER_NAME}.zip ./${FLODER_NAME}
  echo "Create a ${FLODER_NAME}.zip"
  rm -rf ./${FLODER_NAME}
  echo "Del ./${FLODER_NAME} "
else
  echo "Pack process failed"
  echo "Input error(publishing feature number)"
  exit 0
fi
echo ">>End to pack"

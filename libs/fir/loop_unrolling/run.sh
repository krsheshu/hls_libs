#!/bin/bash

if [[ $1 == "-h" ]]; then

  echo "Usage : $0          - to make the complete program and display the comparison results"
  echo "      : $0 -nomake  - don't run make, just display the results"
  echo "      : $0 -h       - Display this help"
  exit

fi


#Change the project name
PROJECT_NAME=loop_unrolling

#Change the following when needed
BUILD_DIR=builds
CLK10=10
CLK5=5
CLK1=1
SOLUTION_NAME_10_NS=ns${CLK10}
SOLUTION_NAME_5_NS=ns${CLK5}
SOLUTION_NAME_1_NS=ns${CLK1}
rpt_file=syn/report/${PROJECT_NAME}_csynth.rpt

if [[ $1 != "-nomake" ]]; then

  make clean
  make PROJECT_NAME=${PROJECT_NAME} SOLUTION_NAME=${SOLUTION_NAME_10_NS} TARGET_CLOCK_PERIOD_NS=${CLK10}
  #make PROJECT_NAME=${PROJECT_NAME} SOLUTION_NAME=${SOLUTION_NAME_5_NS}  TARGET_CLOCK_PERIOD_NS=${CLK5}
  #make PROJECT_NAME=${PROJECT_NAME} SOLUTION_NAME=${SOLUTION_NAME_1_NS}  TARGET_CLOCK_PERIOD_NS=${CLK1}

fi

gvimdiff  ${BUILD_DIR}/${PROJECT_NAME}/${SOLUTION_NAME_10_NS}/${rpt_file} \
         # ${BUILD_DIR}/${PROJECT_NAME}/${SOLUTION_NAME_5_NS}/${rpt_file}  \
         # ${BUILD_DIR}/${PROJECT_NAME}/${SOLUTION_NAME_1_NS}/${rpt_file}


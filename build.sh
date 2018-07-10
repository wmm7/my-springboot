#!/usr/bin/env bash
set -e

MODULE_NAME=my-springboot


SCRIPT_DIR="${BASH_SOURCE-$0}"
SCRIPT_DIR="$(dirname "${SCRIPT_DIR}")"
SCRIPT_DIR="$(cd "${SCRIPT_DIR}"; pwd)"
OUTPUT_DIR="${SCRIPT_DIR}/output"

JDK_DIR="/usr/local/jdk1.8.0_65"

if [ -d "${JDK_DIR}" ]
then
  export JAVA_HOME="${JDK_DIR}"
fi

export MAVEN_OPTS="-Xms256m -Xmx1028m -Xss20m"

BUILD_COMMAND="mvn package -B -e -U -am -Dmaven.test.skip=true"

${BUILD_COMMAND}

rm -rf ${OUTPUT_DIR}
mkdir -p ${OUTPUT_DIR}
tar -zxf ${SCRIPT_DIR}/target/${MODULE_NAME}.tar.gz --strip 1 --directory ${OUTPUT_DIR}

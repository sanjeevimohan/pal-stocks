#!/bin/bash

set -e +x

pushd pal-stocks
  echo "Packaging WAR"
  ./mvnw clean package -DskipTests
popd

war_count=`find pal-stocks/target -type f -name *.war | wc -l`

if [ $war_count -gt 1 ]; then
  echo "More than one war found, don't know which one to deploy. Exiting"
  exit 1
fi

find pal-stocks/target -type f -name *.war -exec cp "{}" package-output/pal-stocks.war \;

echo "Done packaging"
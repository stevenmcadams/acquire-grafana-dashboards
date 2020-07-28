#!/bin/bash

for f in dashboards/*.jsonnet
do
    input_file=$(basename $f)
    dashboard=$(echo $input_file | sed 's/jsonnet/json/g')
    echo "generating $dashboard"
    jsonnet $f -o docker/grafana/provisioning/dashboards/$dashboard
done

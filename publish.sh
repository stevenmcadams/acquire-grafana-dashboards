#!/usr/bin/env bash

for f in dashboards/*.jsonnet
do
    input_file=$(basename $f)
    dashboard=$(echo $input_file | sed 's/jsonnet/json/g')
    echo ""
    echo "==========================="
    echo "generating $dashboard"
    echo "==========================="
    jsonnet $f -o docker/grafana/provisioning/dashboards/$dashboard
    payload="{\"dashboard\": $(jq . docker/grafana/provisioning/dashboards/$dashboard), \"overwrite\": true}"

    curl -X POST $BASIC_AUTH \
        -H 'Content-Type: application/json' \
        -d "${payload}" \
        "http://admin:admin@localhost:3000/api/dashboards/db"
done

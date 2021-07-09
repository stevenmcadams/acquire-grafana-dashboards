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
    payload="{\"dashboard\": $(jq . docker/grafana/provisioning/dashboards/$dashboard), \"overwrite\": true, \"folderId\":534}"

    curl -X POST \
        -H 'Content-Type: application/json' \
        -H "Authorization: Bearer $JWT_TOKEN" \
        -d "${payload}" \
        "https://sauron.datasite.com/api/dashboards/db"
done

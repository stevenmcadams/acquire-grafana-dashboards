# acquire-grafana-dashboards

jsonnet wrapper for acquire grafana dashboards

## tooling requirements
### jsonnet

https://jsonnet.org/

on mac this can be install via brew:
```bash
brew install jsonnet
```

### jq

https://stedolan.github.io/jq/

on mac this can be install via brew:
```bash
brew install jq
```

## generating dashboards
```bash
./generate.sh
```

this will loop over all `*.jsonnet` files in the `dashboards` directory and spit out compiled `*.json` files into `docker/grafana/provisioning/dashboards` which should automatically get picked up by the local grafana instance

## running
```bash
docker-compse up -d
```

open grafana UI [http://localhost:3000]
username : admin
password : admin


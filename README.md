# Cosmo Tech redis image with modules
Installed modules:
* redis graph
* redis json
* redis timeseries

This image is used by Cosmo Tech with [Bitnami Redis Helm chart](https://github.com/bitnami/charts/tree/master/bitnami/redisi).
Use the values-cosmotech-cluster.yaml file in order to load the modules:
``` bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade --install --namespace redis cosmotechredis bitnami/redis --values https://raw.githubusercontent.com/Cosmo-Tech/cosmotech-redis/main/values-cosmotech-cluster.yaml --create-namespace --wait
```

The redis.conf file is however configured correctly for standalone usage.

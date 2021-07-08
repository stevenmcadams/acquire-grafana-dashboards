local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
    cluster():: grafana.template.new(
        name='cluster',
        datasource=datasite.config.datasource,
        query='label_values(jvm_memory_used_bytes, cluster)',
        refresh='time',
        includeAll=false,
        multi=true,
        sort=1
    ),
    service():: grafana.template.new(
        name='service',
        datasource=datasite.config.datasource,
        query='label_values(jvm_memory_used_bytes{cluster=~"^$cluster"}, service)',
        refresh='time',
        includeAll=false,
        multi=false,
        sort=1
    ),
    pod():: grafana.template.new(
        name='pod',
        datasource=datasite.config.datasource,
        query='label_values(jvm_memory_used_bytes{cluster=~"^$cluster", service=~"^$service"}, pod)',
        refresh='time',
        includeAll=true,
        multi=true,
        sort=1
    ),
    httpServer():: grafana.template.new(
        name='http_server_requests',
        datasource=datasite.config.datasource,
        query='label_values(http_server_requests_seconds_sum, uri)',
        refresh='time',
        includeAll=false,
        multi=true,
        sort=1
    ),
    httpClient():: grafana.template.new(
        name='http_client_requests',
        datasource=datasite.config.datasource,
        query='label_values(http_client_requests_seconds_sum, uri)',
        refresh='time',
        includeAll=false,
        multi=true,
        sort=1
    )
}
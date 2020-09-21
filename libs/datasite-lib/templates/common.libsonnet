local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
    env():: grafana.template.new(
        name='env',
        datasource=datasite.config.datasource,
        query='label_values(env)',
        refresh='time',
        includeAll=false,
        multi=false,
        sort=1
    ),
    application():: grafana.template.new(
        name='application',
        datasource=datasite.config.datasource,
        query='label_values(application)',
        refresh='time',
        includeAll=false,
        multi=false,
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
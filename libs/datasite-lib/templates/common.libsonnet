local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
    cluster(
        metric='jvm_memory_used_bytes'
    ):: grafana.template.new(
        name='cluster',
        datasource=datasite.config.datasource,
        query='label_values('+metric+', cluster)',
        refresh='time',
        includeAll=false,
        multi=true,
        sort=1
    ),
    service(
        metric='jvm_memory_used_bytes'
    ):: grafana.template.new(
        name='service',
        datasource=datasite.config.datasource,
        query='label_values('+metric+'{cluster=~"^$cluster"}, service)',
        refresh='time',
        includeAll=false,
        multi=false,
        sort=1
    ),
    pod(
        metric='jvm_memory_used_bytes'
    ):: grafana.template.new(
        name='pod',
        datasource=datasite.config.datasource,
        query='label_values('+metric+'{cluster=~"^$cluster", service=~"^$service"}, pod)',
        refresh='time',
        includeAll=true,
        multi=true,
        sort=1
    ),
    httpServer():: grafana.template.new(
        name='http_server_requests',
        datasource=datasite.config.datasource,
        query='label_values(http_server_requests_seconds_sum{' + datasite.config.global_filter + '}, uri)',
        refresh='time',
        includeAll=true,
        multi=true,
        sort=1
    ),
    httpClient():: grafana.template.new(
        name='http_client_requests',
        datasource=datasite.config.datasource,
        query='label_values(http_client_requests_seconds_sum{' + datasite.config.global_filter + '}, uri)',
        refresh='time',
        includeAll=true,
        multi=true,
        sort=1
    ),
    rabbit():: grafana.template.new(
        name='rabbit',
        datasource=datasite.config.datasource,
        query='label_values(rabbitmq_connections{' + datasite.config.global_filter + '}, name)',
        refresh='time',
        includeAll=true,
        multi=true,
        sort=1,
        hide='true'
    ),
    rabbitQueues():: grafana.template.new(
        name='rabbit_queues',
        datasource=datasite.config.datasource,
        query='label_values(spring_rabbitmq_listener_seconds_max{' + datasite.config.global_filter + '}, queue)',
        refresh='time',
        includeAll=true,
        multi=true,
        sort=1,
        hide='true'
    )
}
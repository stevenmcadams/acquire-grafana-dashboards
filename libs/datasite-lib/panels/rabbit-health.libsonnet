local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

local queryBuilder = {
  new(
    global=null,
    metric=null
  ):: {
    query: if global then 'sum by (name) ('+metric+'{' + datasite.config.global_filter + '})' else 'sum by (name) ('+metric+'{' + datasite.config.global_filter + ', name=~"^$rabbit"})'
  }
};

{
  new(
    title='Rabbit Health Metrics',
    global=false,
    span=4
  ):: grafana.graphPanel.new(
    title=if global then 'Global ' + title else title + ' - $rabbit',
    span=span,
    datasource=datasite.config.datasource,
    repeat=if global then null else 'rabbit',
    repeatDirection=if global then null else 'v',
  )
  .addTarget(
    grafana.prometheus.target(
      expr = queryBuilder.new(global=global, metric='rabbitmq_connections').query,
      legendFormat = 'connections - {{name}}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = queryBuilder.new(global=global, metric='rabbitmq_channels').query,
      legendFormat = 'channels - {{name}}'
    )
  ),

}

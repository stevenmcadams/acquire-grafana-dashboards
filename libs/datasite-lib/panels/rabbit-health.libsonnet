local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

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
      expr = if global then 'sum by (name) (rabbitmq_connections{' + datasite.config.global_filter + '})' else 'sum by (name) (rabbitmq_connections{' + datasite.config.global_filter + ', name=~"^$rabbit"})',
      legendFormat = 'connections - {{name}}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = if global then 'sum by (name) (rabbitmq_channels{' + datasite.config.global_filter + '})' else 'sum by (name) (rabbitmq_channels{' + datasite.config.global_filter + ', name=~"^$rabbit"})',
      legendFormat = 'channels - {{name}}'
    )
  ),

}

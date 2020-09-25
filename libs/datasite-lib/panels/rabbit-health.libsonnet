local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Rabbit Health Metrics',
    span=4
  )::   grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'sum by ($env) (rabbitmq_connections)',
      legendFormat = 'connections'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'sum by ($env) (rabbitmq_channels)',
      legendFormat = 'channels'
    )
  ),

}
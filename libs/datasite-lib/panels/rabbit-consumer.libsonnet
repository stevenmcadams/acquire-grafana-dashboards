local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Rabbit Consumer Metrics'
  )::   grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'sum by (env) (rate(rabbitmq_rejected_total[1m]))',
      legendFormat = 'rejected total'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'sum by (env) (rate(rabbitmq_acknowledged_total[1m]))',
      legendFormat = 'acknowledged total'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'sum by (env) (rate(rabbitmq_consumed_total[1m]))',
      legendFormat = 'consumed total'
    )
  ),

}

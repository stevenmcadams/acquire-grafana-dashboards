local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Rabbit Consumer Metrics',
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
      expr = if global then 'sum by (name) (rate(rabbitmq_rejected_total{' + datasite.config.global_filter + '}[1m]))' else 'sum by (name) (rate(rabbitmq_rejected_total{' + datasite.config.global_filter + ', name=~"^$rabbit"}[1m]))',
      legendFormat = 'rejected total - {{name}}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = if global then 'sum by (name) (rate(rabbitmq_acknowledged_total{' + datasite.config.global_filter + '}[1m]))' else 'sum by (name) (rate(rabbitmq_rejected_total{' + datasite.config.global_filter + ', name=~"^$rabbit"}[1m]))',
      legendFormat = 'acknowledged total - {{name}}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = if global then 'sum by (name) (rate(rabbitmq_consumed_total{' + datasite.config.global_filter + '}[1m]))' else 'sum by (name) (rate(rabbitmq_consumed_total{' + datasite.config.global_filter + ', name=~"^$rabbit"}[1m]))',
      legendFormat = 'consumed total - {{name}}'
    )
  ),

}

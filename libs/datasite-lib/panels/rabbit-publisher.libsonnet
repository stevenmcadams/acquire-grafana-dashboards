local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Rabbit Publisher Metrics',
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
      expr = if global then 'sum by (name) (rate(rabbitmq_published_total{' + datasite.config.global_filter + '}[1m]))' else 'sum by (name) (rate(rabbitmq_published_total{' + datasite.config.global_filter + ', name=~"^$rabbit"}[1m]))',
      legendFormat = 'published total - {{name}}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = if global then 'sum by (name) (rate(rabbitmq_not_acknowledged_published_total{' + datasite.config.global_filter + '}[1m]))' else 'sum by (name) (rate(rabbitmq_not_acknowledged_published_total{' + datasite.config.global_filter + ', name=~"^$rabbit"}[1m]))',
      legendFormat = 'not acknowledged published total - {{name}}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = if global then 'sum by (name) (rate(rabbitmq_acknowledged_published_total{' + datasite.config.global_filter + '}[1m]))' else 'sum by (name) (rate(rabbitmq_acknowledged_published_total{' + datasite.config.global_filter + ', name=~"^$rabbit"}[1m]))',
      legendFormat = 'acknowledged published total - {{name}}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = if global then 'sum by (name) (rate(rabbitmq_failed_to_publish_total{' + datasite.config.global_filter + '}[1m]))' else 'sum by (name) (rate(rabbitmq_failed_to_publish_total{' + datasite.config.global_filter + ', name=~"^$rabbit"}[1m]))',
      legendFormat = 'failed to publish total - {{name}}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = if global then 'sum by (name) (rate(rabbitmq_unrouted_published_total{' + datasite.config.global_filter + '}[1m]))' else 'sum by (name) (rate(rabbitmq_unrouted_published_total{' + datasite.config.global_filter + ', name=~"^$rabbit"}[1m]))',
      legendFormat = 'unrouted published total - {{name}}'
    )
  ),

}

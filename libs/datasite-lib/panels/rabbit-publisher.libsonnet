local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Rabbit Publisher Metrics'
  )::   grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'sum by (env) (rate(rabbitmq_published_total[1m]{' + datasite.config.global_filter + '}))',
      legendFormat = 'published total'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'sum by (env) (rate(rabbitmq_not_acknowledged_published_total{' + datasite.config.global_filter + '}[1m]))',
      legendFormat = 'not acknowledged published total'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'sum by (env) (rate(rabbitmq_acknowledged_published_total{' + datasite.config.global_filter + '}[1m]))',
      legendFormat = 'acknowledged published total'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'sum by (env) (rate(rabbitmq_failed_to_publish_total{' + datasite.config.global_filter + '}[1m]))',
      legendFormat = 'failed to publish total'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'sum by (env) (rate(rabbitmq_unrouted_published_total{' + datasite.config.global_filter + '}[1m]))',
      legendFormat = 'unrouted published total'
    )
  ),

}

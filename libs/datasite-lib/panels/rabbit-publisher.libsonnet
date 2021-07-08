local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

local queryBuilder = {
  new(
    global=null,
    metric=null
  ):: {
    query: if global then 'sum by (name) (rate('+metric+'{' + datasite.config.global_filter + '}[1m]))' else 'sum by (name) (rate('+metric+'{' + datasite.config.global_filter + ', name=~"^$rabbit"}[1m]))',
  }
};


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
      expr = queryBuilder.new(global=global, metric='rabbitmq_published_total').query,
      legendFormat = 'published total - {{name}}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = queryBuilder.new(global=global, metric='rabbitmq_not_acknowledged_published_total').query,
      legendFormat = 'not acknowledged published total - {{name}}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = queryBuilder.new(global=global, metric='rabbitmq_acknowledged_published_total').query,
      legendFormat = 'acknowledged published total - {{name}}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = queryBuilder.new(global=global, metric='rabbitmq_failed_to_publish_total').query,
      legendFormat = 'failed to publish total - {{name}}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = queryBuilder.new(global=global, metric='rabbitmq_unrouted_published_total').query,
      legendFormat = 'unrouted published total - {{name}}'
    )
  ),

}

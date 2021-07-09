local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

local queryBuilder = {
  new(
    global=null,
    metric=null
  ):: {
    query: if global then 'sum by (queue) (rate('+metric+'{' + datasite.config.global_filter + '}[1m]))' else 'sum by (queue) (rate('+metric+'{' + datasite.config.global_filter + ', queue=~"^$rabbit_queues"}[1m]))'
  }
};


{
  new(
    title='Rabbit Queue Metrics',
    global=false,
    span=4
  ):: grafana.graphPanel.new(
    title=if global then 'Global ' + title else title + ' - $rabbit_queues',
    span=if global then 12 else span,
    datasource=datasite.config.datasource,
    repeat=if global then null else 'rabbit_queues',
    repeatDirection=if global then null else 'h',
  )
  .addTarget(
    grafana.prometheus.target(
      expr = queryBuilder.new(global=global, metric='spring_rabbitmq_listener_seconds_max').query,
      legendFormat = 'max',
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = queryBuilder.new(global=global, metric='spring_rabbitmq_listener_seconds_count').query,
      legendFormat = 'count',
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = queryBuilder.new(global=global, metric='spring_rabbitmq_listener_seconds_sum').query,
      legendFormat = 'sum',
    )
  ),

}

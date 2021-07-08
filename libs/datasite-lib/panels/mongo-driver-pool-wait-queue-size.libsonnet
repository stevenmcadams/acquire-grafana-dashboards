local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='MongoDB Driver Pool Wait Queue',
    span=3
  ):: grafana.graphPanel.new(
    title=title,
    span=span,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'mongodb_driver_pool_waitqueuesize{' + datasite.config.global_filter + '}',
      legendFormat = 'wait queue size'
    )
  ),
}

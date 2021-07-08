local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='MongoDB Driver Pool Size',
    span=3
  ):: grafana.graphPanel.new(
    title=title,
    span=span,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'mongodb_driver_pool_size{' + datasite.config.global_filter + '}',
      legendFormat = 'pool size'
    )
  ),
}

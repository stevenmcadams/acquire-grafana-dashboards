local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Nginx Health',
    span=4
  ):: grafana.graphPanel.new(
    title=title,
    span=span,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'nginx_up{' + datasite.config.global_filter + '}',
      legendFormat = 'up'
    )
  ),
}

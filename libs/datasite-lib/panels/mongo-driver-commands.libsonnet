local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='MongoDB Commands',
    span=3
  ):: grafana.graphPanel.new(
    title=title,
    span=span,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'rate(mongodb_driver_commands_seconds_count{' + datasite.config.global_filter + '}[1m])',
      legendFormat = '{{ command }}'
    )
  ),
}

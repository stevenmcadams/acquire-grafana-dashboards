local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;
{
  new(
    title='Logback Metrics'
  )::   grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'sum by (level) ( rate(logback_events_total{' + datasite.config.global_filter + '}[1m]) )',
      legendFormat = '{{ level }}'
    )
  ),
}

local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    metric,
    title='HTTP Status',
    global=false,
    span=4
  ):: grafana.graphPanel.new(
    title=if global then 'Global ' + title else title + ' - $' + metric,
    span=span,
    datasource=datasite.config.datasource,
    repeat=if global then null else metric,
    repeatDirection=if global then null else 'v',
  )
  .addTarget(
    grafana.prometheus.target(
      expr = if global then 'sum by (status) ( rate('+metric+'_seconds_count[1m]) )' else 'sum by (status) ( rate('+metric+'_seconds_count{uri="[['+metric+']]"}[1m]) )',
      legendFormat = '{{ status }}'
    )
  ),
}
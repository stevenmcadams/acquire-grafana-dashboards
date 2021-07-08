local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    metric,
    title='HTTP Throughput',
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
      expr = if global then 'irate('+metric+'_seconds_count{' + datasite.config.global_filter + '}[1m])' else 'irate('+metric+'_seconds_count{' + datasite.config.global_filter + ', uri=~"$'+metric+'"}[1m])',
      legendFormat = '{{ uri }}'
    )
  ),
}
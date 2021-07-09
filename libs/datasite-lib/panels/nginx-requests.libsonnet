local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Nginx Requests',
    span=4
  ):: grafana.graphPanel.new(
    title=title,
    span=span,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'rate(nginx_http_requests_total{' + datasite.config.global_filter + '}[1m])',
      legendFormat = 'http requests / min'
    )
  ),
}

local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Nginx Connections',
    span=4
  ):: grafana.graphPanel.new(
    title=title,
    span=span,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'rate(nginx_connections_accepted{' + datasite.config.global_filter + '}[1m])',
      legendFormat = 'accepted connections / min'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'rate(nginx_connections_handled{' + datasite.config.global_filter + '}[1m])',
      legendFormat = 'handled connections / min'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'nginx_connections_active{' + datasite.config.global_filter + '}',
      legendFormat = 'active connections'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'nginx_connections_reading{' + datasite.config.global_filter + '}',
      legendFormat = 'reading connections'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'nginx_connections_waiting{' + datasite.config.global_filter + '}',
      legendFormat = 'waiting connections'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'nginx_connections_writing{' + datasite.config.global_filter + '}',
      legendFormat = 'writing connections'
    )
  ),

}

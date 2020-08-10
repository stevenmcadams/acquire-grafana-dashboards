local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='JVM Thread Count'
  )::   grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'jvm_threads_daemon_threads',
      legendFormat = 'daemon - {{ instance }}'
    )
  ).addTarget(
    grafana.prometheus.target(
      expr = 'jvm_threads_live_threads',
      legendFormat = 'live - {{ instance }}'
    )
  ).addTarget(
    grafana.prometheus.target(
      expr = 'jvm_threads_peak_threads',
      legendFormat = 'peak - {{ instance }}'
    )
  ),
}

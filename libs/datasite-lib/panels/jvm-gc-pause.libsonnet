local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='JVM GC Pause'
  )::   grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'rate(jvm_gc_pause_seconds_count[1m])',
      legendFormat = 'count - {{ instance }} - {{ action }}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'jvm_gc_pause_seconds_max',
      legendFormat = 'max - {{ instance }} - {{ action }}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'rate(jvm_gc_pause_seconds_sum[1m])',
      legendFormat = 'total - {{ instance }} - {{ action }}'
    )
  ),
}

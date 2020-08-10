local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='JVM GC Memory'
  )::   grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
    .addTarget(
    grafana.prometheus.target(
      expr = 'rate(jvm_gc_memory_allocated_bytes_total[1m])',
      legendFormat = 'allocated - {{ instance }}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'rate(jvm_gc_memory_promoted_bytes_total[1m])',
      legendFormat = 'promoted - {{ instance }}'
    )
  ),
}

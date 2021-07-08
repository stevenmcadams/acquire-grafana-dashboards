local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='JVM GC Data'
  )::   grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'jvm_gc_live_data_size_bytes{' + datasite.config.global_filter + '}',
      legendFormat = 'live - {{ instance }}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'jvm_gc_max_data_size_bytes{' + datasite.config.global_filter + '}',
      legendFormat = 'max - {{ instance }}'
    )
  ),
}

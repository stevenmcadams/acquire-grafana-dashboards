local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='JVM Buffer Memory'
  )::   grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'jvm_buffer_memory_used_bytes',
      legendFormat = '{{ id }}'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'jvm_buffer_total_capacity_bytes',
      legendFormat = '{{ id }}'
    )
  ),
}

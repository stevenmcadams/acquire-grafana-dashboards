local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='JVM Buffer Count'
  ):: grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'jvm_buffer_count_buffers{' + datasite.config.global_filter + '}',
      legendFormat = '{{ id }}'
    )
  ),
}

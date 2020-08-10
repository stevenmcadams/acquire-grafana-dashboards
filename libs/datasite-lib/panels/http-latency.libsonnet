local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='HTTP Latency'
  ):: grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'jvm_threads_states_threads',
      legendFormat = '{{ instance }} - {{ state }}'
    )
  ),
}
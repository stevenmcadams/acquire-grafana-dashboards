local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='JVM Thread State'
  )::   grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'jvm_threads_states_threads{application="$application"}',
      legendFormat = '{{ state }}'
    )
  ),
}

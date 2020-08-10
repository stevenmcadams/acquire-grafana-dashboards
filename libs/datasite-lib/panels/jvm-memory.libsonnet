local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='JVM Memory'
  )::   grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'jvm_memory_committed_bytes',
      legendFormat = 'committed - {{ area }} - {{ instance }}'
    )
  ).addTarget(
    grafana.prometheus.target(
      expr = 'jvm_memory_max_bytes',
      legendFormat = 'max - {{ area }} - {{ instance }}'
    )
  ).addTarget(
    grafana.prometheus.target(
      expr = 'jvm_memory_used_bytes',
      legendFormat = 'used - {{ area }} - {{ instance }}'
    )
  ),
}

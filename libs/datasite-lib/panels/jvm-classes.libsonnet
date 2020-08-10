local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='JVM Classes'
  )::   grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'jvm_classes_loaded_classes',
      legendFormat = 'loaded'
    )
  )
  .addTarget(
    grafana.prometheus.target(
      expr = 'rate(jvm_classes_unloaded_classes_total[1m])',
      legendFormat = 'unloaded'
    )
  ),
}

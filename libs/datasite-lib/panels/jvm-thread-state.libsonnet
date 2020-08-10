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
}

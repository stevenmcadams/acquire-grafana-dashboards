local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='HTTP Throughput'
  ):: grafana.graphPanel.new(
    title=title,
    datasource=datasite.config.datasource
  )
}
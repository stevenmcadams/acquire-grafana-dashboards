local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Logback Usage'
  ):: grafana.row.new(
        title=title
    )
    .addPanels([
      datasite.panels.logback.new()
    ]),
}

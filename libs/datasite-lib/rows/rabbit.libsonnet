local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Rabbit Usage'
  ):: grafana.row.new(
        title=title
    )
    .addPanels([
      datasite.panels.rabbit.new()
    ]),
}

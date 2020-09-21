local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Rabbit Usage'
  ):: grafana.row.new(
        title=title,
        collapse=true
    )
    .addPanels([
      datasite.panels.rabbitHealth.new(),
      datasite.panels.rabbitConsumer.new(),
      datasite.panels.rabbitPublisher.new()
    ]),
}

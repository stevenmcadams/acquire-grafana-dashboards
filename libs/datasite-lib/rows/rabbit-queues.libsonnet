local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Rabbit Queues'
  ):: grafana.row.new(
        title=title,
        collapse=true
    )
    .addPanels([
      datasite.panels.rabbitQueues.new(global=true),
      datasite.panels.rabbitQueues.new(),
    ]),
}

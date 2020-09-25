local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Mongo DB'
  ):: grafana.row.new(
        title=title,
        collapse=true
    )
    .addPanels([
      datasite.panels.mongoDriverCommands.new(),
      datasite.panels.mongoDriverPoolCheckedOut.new(),
      datasite.panels.mongoDriverPoolSize.new(),
      datasite.panels.mongoDriverPoolWaitQueueSize.new(),
    ]),
}

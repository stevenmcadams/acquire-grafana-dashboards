local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='HTTP Server Requests'
  ):: grafana.row.new(
      title=title
    )
    .addPanels([
      datasite.panels.httpLatency.new(),
      datasite.panels.httpStatus.new(),
      datasite.panels.httpThroughput.new()
    ]),
}

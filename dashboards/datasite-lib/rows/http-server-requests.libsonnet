local grafana = import '../../grafonnet-lib/grafonnet/grafana.libsonnet';
local datasite = import '../index.libsonnet';

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

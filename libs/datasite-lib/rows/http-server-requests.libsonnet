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
      datasite.panels.httpLatency.new(global=true, metric='http_server_requests'),
      datasite.panels.httpStatus.new(global=true, metric='http_server_requests'),
      datasite.panels.httpThroughput.new(global=true, metric='http_server_requests'),
      datasite.panels.httpLatency.new(metric='http_server_requests'),
      datasite.panels.httpStatus.new(metric='http_server_requests'),
      datasite.panels.httpThroughput.new(metric='http_server_requests')
    ]),
}

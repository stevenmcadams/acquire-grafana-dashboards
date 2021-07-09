local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='Nginx Metrics'
  ):: grafana.row.new(
        title=title,
        collapse=true
    )
    .addPanels([
      datasite.panels.nginxConnections.new(),
      datasite.panels.nginxRequests.new(),
      datasite.panels.nginxHealth.new(),
    ]),
}

local libs = import '../libs/index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

grafana.dashboard.new(
  'Nginx Services',
  tags=['nginx'],
  editable=false,
  time_from='now-1h',
  refresh='1m',
)
.addTemplates([
  datasite.templates.common.cluster(metric='nginx_up'),
  datasite.templates.common.service(metric='nginx_up'),
  datasite.templates.common.pod(metric='nginx_up'),
])
.addRows([
  datasite.rows.nginx.new()
])

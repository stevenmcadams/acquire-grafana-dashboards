local libs = import '../libs/index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

grafana.dashboard.new(
  'Task List Service',
  tags=['acquire', 'task-list'],
  editable=true,
  time_from='now-1h',
  refresh='1m',
)
.addTemplates([
  datasite.templates.common.env(),
  datasite.templates.common.application(),
  datasite.templates.common.httpServer(),
  datasite.templates.common.httpClient()
])
.addRows([
  datasite.rows.httpServerRequests.new(),
  datasite.rows.httpClientRequests.new(),
  datasite.rows.jvm.new(),
  datasite.rows.rabbit.new(),
  datasite.rows.logback.new(),
])

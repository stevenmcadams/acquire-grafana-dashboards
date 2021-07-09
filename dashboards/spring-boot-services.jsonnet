local libs = import '../libs/index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

grafana.dashboard.new(
  'Spring Boot Services',
  tags=['k8s', 'spring-boot'],
  editable=false,
  time_from='now-1h',
  refresh='1m',
)
.addTemplates([
  datasite.templates.common.cluster(),
  datasite.templates.common.service(),
  datasite.templates.common.pod(),
  datasite.templates.common.httpServer(),
  datasite.templates.common.httpClient(),
  datasite.templates.common.rabbit(),
  datasite.templates.common.rabbitQueues()
])
.addRows([
  datasite.rows.httpServerRequests.new(),
  datasite.rows.httpClientRequests.new(),
  datasite.rows.mongodb.new(),
  datasite.rows.jvm.new(),
  datasite.rows.rabbitQueues.new(),
  datasite.rows.rabbit.new(),
  datasite.rows.logback.new(),
])

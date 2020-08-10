local grafana = import 'grafonnet-lib/grafonnet/grafana.libsonnet';
local datasite = import 'datasite-lib/index.libsonnet';

grafana.dashboard.new(
  'Task List Service',
  tags=['acquire', 'task-list'],
  editable=true,
  time_from='now-1h',
  refresh='1m',
)
.addRows([
  datasite.rows.httpServerRequests.new(),
  datasite.rows.jvm.new(),
  datasite.rows.rabbit.new(),
])

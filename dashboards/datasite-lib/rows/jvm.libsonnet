local grafana = import '../../grafonnet-lib/grafonnet/grafana.libsonnet';
local datasite = import '../../datasite-lib/index.libsonnet';

{
  new(
    title='JVM Usage'
  ):: grafana.row.new(
        title=title
    )
    .addPanels([
      datasite.panels.jvm.new()
    ]),
}

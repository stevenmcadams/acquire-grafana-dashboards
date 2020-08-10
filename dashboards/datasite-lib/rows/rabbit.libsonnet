local grafana = import '../../grafonnet-lib/grafonnet/grafana.libsonnet';
local datasite = import '../../datasite-lib/index.libsonnet';

{
  new(
    title='Rabbit Usage'
  ):: grafana.row.new(
        title=title
    )
    .addPanels([
      datasite.panels.rabbit.new()
    ]),
}

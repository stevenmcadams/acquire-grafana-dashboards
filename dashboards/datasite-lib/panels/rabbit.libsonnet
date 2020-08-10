local grafana = import '../../grafonnet-lib/grafonnet/grafana.libsonnet';

{
  new(
    title='Rabbit Metrics'
  ):: grafana.graphPanel.new(title=title),
}

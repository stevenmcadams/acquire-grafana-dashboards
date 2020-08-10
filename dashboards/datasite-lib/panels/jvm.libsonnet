local grafana = import '../../grafonnet-lib/grafonnet/grafana.libsonnet';

{
  new(
    title='JVM Metrics'
  ):: grafana.graphPanel.new(title=title),
}

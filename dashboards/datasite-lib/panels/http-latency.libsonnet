local grafana = import '../../grafonnet-lib/grafonnet/grafana.libsonnet';

{
    new(
        title='HTTP Latency'
    ):: grafana.graphPanel.new(
        title=title
    ),
}
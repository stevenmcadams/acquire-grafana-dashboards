local grafana = import '../../grafonnet-lib/grafonnet/grafana.libsonnet';

{
    new(
        title='HTTP Throughput'
    ):: grafana.graphPanel.new(
        title=title
    ),
}
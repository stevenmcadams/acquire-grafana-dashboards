local grafana = import '../../grafonnet-lib/grafonnet/grafana.libsonnet';

{
    new(
        title='HTTP Status'
    ):: grafana.graphPanel.new(
        title=title
    ),
}
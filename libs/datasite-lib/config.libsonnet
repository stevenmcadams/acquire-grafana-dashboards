{
  datasource: "Prometheus",
  global_filter: 'cluster=~"^$cluster", service=~"^$service", pod=~"^$pod"'
}
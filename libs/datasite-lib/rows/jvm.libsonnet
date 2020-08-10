local libs = import '../../index.libsonnet';
local grafana = libs.grafana;
local datasite = libs.datasite;

{
  new(
    title='JVM'
  ):: grafana.row.new(
        title=title
    )
    .addPanels([
      datasite.panels.jvmBufferCount.new(),
      datasite.panels.jvmBufferMemory.new(),
      datasite.panels.jvmClasses.new(),
      datasite.panels.jvmGcData.new(),
      datasite.panels.jvmGcMemory.new(),
      datasite.panels.jvmGcPause.new(),
      datasite.panels.jvmMemory.new(),
      datasite.panels.jvmThreadCount.new(),
      datasite.panels.jvmThreadState.new(),
    ]),
}

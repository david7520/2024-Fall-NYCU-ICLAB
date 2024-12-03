setMultiCpuUsage -localCpu 16 -cpuPerRemoteHost 1 -remoteHost 0 -keepLicense true

#====================================================================
#  15. Add PAD Filler
#====================================================================
addIoFiller -cell EMPTY16D -prefix IOFILLER
addIoFiller -cell EMPTY8D -prefix IOFILLER
addIoFiller -cell EMPTY4D -prefix IOFILLER
addIoFiller -cell EMPTY2D -prefix IOFILLER
addIoFiller -cell EMPTY1D -prefix IOFILLER -fillAnyGap

#====================================================================
#  16. SI-Prevention Detail Route (NanoRoute)
#====================================================================
setNanoRouteMode -quiet -routeInsertAntennaDiode 1
setNanoRouteMode -quiet -routeAntennaCellName ANTENNA
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -routeWithSiDriven 1
setNanoRouteMode -quiet -routeTdrEffort 10
setNanoRouteMode -quiet -routeTopRoutingLayer 6
setNanoRouteMode -quiet -routeBottomRoutingLayer 1
setNanoRouteMode -quiet -drouteEndIteration 100
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
routeDesign -globalDetail

saveDesign CHIP_nanoRoute.inn
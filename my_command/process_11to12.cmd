setMultiCpuUsage -localCpu 32 -cpuPerRemoteHost 1 -remoteHost 0 -keepLicense true

#====================================================================
#  11. Place Standard Cells
#====================================================================
setPlaceMode -prerouteAsObs {2 3}
setPlaceMode -fp false
place_design -noPrePlaceOpt

saveDesign CHIP_placement.inn

#====================================================================
#  12. In-Place Optimization (IPO)
# Before Clock Tree Synthesis → Check Timing
#====================================================================
timeDesign -preCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix CHIP_preCTS -outDir timingReports

#=================
#  ECO → Optimize
#=================
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS

saveDesign CHIP_preCTS.inn
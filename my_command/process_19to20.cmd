setMultiCpuUsage -localCpu 32 -cpuPerRemoteHost 1 -remoteHost 0 -keepLicense true

#====================================================================
#   19. Add CORE Filler Cells
#====================================================================
getFillerMode -quiet
addFiller -cell FILLERCC FILLERBC FILLERAC FILLER8C FILLER8 FILLER64 FILLER4C FILLER4 FILLER32 FILLER2C FILLER2 FILLER16 FILLER1 -prefix FILLER

# === check DRC ===
get_verify_drc_mode -disable_rules -quiet
get_verify_drc_mode -quiet -area
get_verify_drc_mode -quiet -layer_range
get_verify_drc_mode -check_ndr_spacing -quiet
get_verify_drc_mode -check_only -quiet
get_verify_drc_mode -check_same_via_cell -quiet
get_verify_drc_mode -exclude_pg_net -quiet
get_verify_drc_mode -ignore_trial_route -quiet
get_verify_drc_mode -max_wrong_way_halo -quiet
get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
get_verify_drc_mode -limit -quiet
set_verify_drc_mode -disable_rules {} -check_ndr_spacing auto -check_only default -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -ignore_cell_blockage false -use_min_spacing_on_block_obs auto -report CHIP.drc.rpt -limit 1000
verify_drc

# === check LVS ===
verifyConnectivity -type all -error 1000 -warning 50


#====================================================================
#   20. Stream Out and Write Netlist
#====================================================================
saveDesign CHIP.inn
write_sdf CHIP.sdf
saveNetlist CHIP.v

# === Area Report ===
summaryReport -noHtml -outfile summaryReport.rpt


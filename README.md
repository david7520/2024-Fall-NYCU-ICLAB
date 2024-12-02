# 2024-Fall-NYCU-ICLAB
Lab11
## Some Notice & Reference

TA forgot to link some file, we first need to relink the relative file (`filelist.f` & `PATTERN.v` & `TESTBED.v`)

[APR](https://timsnote.wordpress.com/digital-ic-design/ic-compiler/)

Don't forget to change the content in LEF file:

`Memory.lef`: 

`ME1 -> metal1`  `ME2 -> metal2` ... and so on
            
`VI1 -> via`     `VI2 -> via2`   ... and so on

`core -> core_5040`

## (Automatic Placement & Route) APR's procedure

**2. Data Preparation**

> please run “./00_combine” to combine the TMIP_SYN.v with CHIP_SHELL.v to be CHIP_SYN.v

Invoke innovus

**2. Reading Cell library information and Netlist for APR**

```bash
source ./my_command/run_apr.cmd
```

**3. Specify Chip Floorplan**

1. Specify core size
> a. Core Utilization: Set any as your wish (0.7~0.8 is suggested)
2. Specify core margin
> b. ◆ Core to IO Boundary / 
Core to Left: 100 / 
Core to Right: 100 / 
Core to Top: 100 / 
Core to Bottom: 100
3. manually place the SRAM marco in Core

4. You don't need to do "Edit Halo", cause I have already written the command in process_3to10.cmd.

**4. Connect / Define Global Net**

**5. Power Planning (Add Core Power Rings)**

**6. Power Planning (Add Block Rings)**

**7. Connect Core Power Pin**

**8. Power Planning (Add Stripes)**

**9. Connect Standard Cell Power Line**

**10. Verify DRC and LVS**

> For process 3 to 10's, run:

```bash
source ./my_command/process_3to10.cmd
```

Please check DRC and LVS on your terminal, I have already written down the command in process_3to10.cmd.

**11. Place Standard Cells**

**12. In-Place Optimization (IPO) - Before CTS**

```bash
source ./my_command/process_11to12.cmd
```
Before Clock Tree Synthesis → Please check Setup Timing on your terminal(I have done the ECO → Optimize on file).

**13. Clock Tree Synthesis (CTS)**

**14. In-Place Optimization (IPO) - After CTS**

```bash
source ./my_command/process_13to14.cmd
```
Please check DRVS, Setup and Hold Time on your terminal(I have done the ECO → Optimize on file).
**15. Add PAD Filler**

**16. SI-Prevention Detail Route (NanoRoute)**

> I have changed the EndIteration to 100 (default is 1): setNanoRouteMode -quiet -drouteEndIteration 100

```bash
source ./my_command/process_15to16.cmd
```
Please check DRC and LVS by yourself.



**17. In-Place Optimization (consider crosstalk effects) - After NanoRoute**

```bash
source ./my_command/process_17.cmd
```


**18. Timing Analysis (Signoff) - Optional**



**19. Add CORE Filler Cells (Just select the filler without C)**

**20. Stream Out and Write Netlist**

```bash
source ./my_command/process_19to20.cmd
```
=== Area Report ===
You can check Area in summaryReport.rpt file, I have already written down the command in process_19to20.cmd.

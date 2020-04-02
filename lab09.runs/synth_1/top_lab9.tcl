# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a200tfbg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Gordoncrew/Desktop/lab09/lab09.cache/wt [current_project]
set_property parent.project_path C:/Users/Gordoncrew/Desktop/lab09/lab09.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:ac701:part0:1.4 [current_project]
set_property ip_output_repo c:/Users/Gordoncrew/Desktop/lab09/lab09.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/sources_1/new/alu.sv
  C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/sources_1/new/register.sv
  C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/sources_1/new/top_lab9.sv
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/constrs_1/imports/Downloads/btnC.xdc
set_property used_in_implementation false [get_files C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/constrs_1/imports/Downloads/btnC.xdc]

read_xdc C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/constrs_1/imports/Downloads/btnD.xdc
set_property used_in_implementation false [get_files C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/constrs_1/imports/Downloads/btnD.xdc]

read_xdc C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/constrs_1/imports/Downloads/btnU.xdc
set_property used_in_implementation false [get_files C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/constrs_1/imports/Downloads/btnU.xdc]

read_xdc C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/constrs_1/imports/Downloads/clock.xdc
set_property used_in_implementation false [get_files C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/constrs_1/imports/Downloads/clock.xdc]

read_xdc C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/constrs_1/imports/Downloads/led.xdc
set_property used_in_implementation false [get_files C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/constrs_1/imports/Downloads/led.xdc]

read_xdc C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/constrs_1/imports/Downloads/switches.xdc
set_property used_in_implementation false [get_files C:/Users/Gordoncrew/Desktop/lab09/lab09.srcs/constrs_1/imports/Downloads/switches.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top top_lab9 -part xc7a200tfbg676-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top_lab9.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_lab9_utilization_synth.rpt -pb top_lab9_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

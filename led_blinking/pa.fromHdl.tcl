
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name led_blinking -dir "/home/ise/Desktop/led_blinking/planAhead_run_1" -part xc6vlx240tff1156-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "tutorial_led_blink.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {led_blink.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top tutorial_led_blink $srcset
add_files [list {tutorial_led_blink.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6vlx240tff1156-2

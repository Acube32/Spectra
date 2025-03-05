
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name fft_virt6 -dir "/home/ise/Desktop/fft_virt6/planAhead_run_2" -part xc6vlx240tff1156-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "spectra.ucf" [current_fileset -constrset]
add_files [list {ipcore_dir/fft.ngc}]
set hdlfile [add_files [list {ipcore_dir/fifo.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/mult.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/sqrt.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
add_files [list {ipcore_dir/sqrt.ngc}]
add_files [list {ipcore_dir/mult.ngc}]
add_files [list {ipcore_dir/fifo.ngc}]
set hdlfile [add_files [list {ipcore_dir/fft.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {fifo_fft_interface.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {complex_magnitude.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {comparator.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {spectra.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top spectra $srcset
add_files [list {spectra.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/mult.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fifo.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/sqrt.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fft.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6vlx240tff1156-2

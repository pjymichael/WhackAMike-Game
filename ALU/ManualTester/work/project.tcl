set projDir "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/vivado"
set projName "ALUUnit"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/au_top_0.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/button_conditioner_1.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/edge_detector_2.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/manualPress_3.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/reset_conditioner_4.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/pipeline_5.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/alu_6.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/adder_7.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/boolean_8.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/shifter_9.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/compare_10.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/random_11.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/edge_detector_12.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/counter_13.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/counter_14.v" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/verilog/pn_gen_15.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/constraint/alchitry.xdc" "C:/Users/Advaitaa/Desktop/TERM4/Comp\ Struct/1D/ALUUnit/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

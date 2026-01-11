quietly set ACTELLIBNAME ProASIC3
quietly set PROJECT_DIR "C:/Users/FHCY/Desktop/J3121000889_test3"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap proasic3 "D:/Microsemi/Libero_SoC_v11.9/Designer/lib/modelsim/precompiled/vlog/proasic3"

vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/lzy_FSM1.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work presynth "${PROJECT_DIR}/stimulus/test_FSM1.v"

vsim -L proasic3 -L presynth  -t 1ps presynth.test_lzy_VM
add wave /test_lzy_VM/*
run 1000ns

quietly set ACTELLIBNAME ProASIC3
quietly set PROJECT_DIR "C:/New Folder2/J312300948_Gate"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap proasic3 "C:/Microsemi/Libero_SoC_v11.9/Designer/lib/modelsim/precompiled/vlog/proasic3"

vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/lzy_gate.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work presynth "${PROJECT_DIR}/stimulus/test_gate.v"

vsim -L proasic3 -L presynth  -t 1ps presynth.test_lzy_BasGate
add wave /test_lzy_BasGate/*
run 1000ns

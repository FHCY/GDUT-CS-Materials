quietly set ACTELLIBNAME ProASIC3
quietly set PROJECT_DIR "E:/3122008883/J3122008883_test3"
onerror { quit -f }
onbreak { quit -f }

if {[file exists postsynth/_info]} {
   echo "INFO: Simulation library postsynth already exists"
} else {
   file delete -force postsynth 
   vlib postsynth
}
vmap postsynth postsynth
vmap proasic3 "C:/Microsemi/Libero_SoC_v11.9/Designer/lib/modelsim/precompiled/vlog/proasic3"

vlog -vlog01compat -work postsynth "${PROJECT_DIR}/synthesis/cyq_74HC165.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work postsynth "${PROJECT_DIR}/stimulus/test_FSM1.v"

vsim -L proasic3 -L postsynth  -t 1ps postsynth.test_cyq_74HC165
add wave /test_cyq_74HC165/*
run 10000ns
log /test_cyq_74HC165/*
exit

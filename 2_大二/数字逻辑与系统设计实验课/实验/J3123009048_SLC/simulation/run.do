quietly set ACTELLIBNAME ProASIC3
quietly set PROJECT_DIR "C:/Users/FHCY/Desktop/study/signal/J3123009048_SLC"

if {[file exists postsynth/_info]} {
   echo "INFO: Simulation library postsynth already exists"
} else {
   file delete -force postsynth 
   vlib postsynth
}
vmap postsynth postsynth
vmap proasic3 "D:/Microsemi/Libero_SoC_v11.9/Designer/lib/modelsim/precompiled/vlog/proasic3"

vlog -vlog01compat -work postsynth "${PROJECT_DIR}/synthesis/lzy_SSD2.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work postsynth "${PROJECT_DIR}/stimulus/test_slc.v"

vsim -L proasic3 -L postsynth  -t 1ps postsynth.test_lzy_SSD2
add wave /test_lzy_SSD2/*
run 1000ns

quietly set ACTELLIBNAME ProASIC3
quietly set PROJECT_DIR "D:/Study/LiberoProjects/J3122008883_SLC"

if {[file exists postsynth/_info]} {
   echo "INFO: Simulation library postsynth already exists"
} else {
   file delete -force postsynth 
   vlib postsynth
}
vmap postsynth postsynth
vmap proasic3 "D:/Libero Soc/Designer/lib/modelsim/precompiled/vlog/proasic3"

vlog -vlog01compat -work postsynth "${PROJECT_DIR}/synthesis/cyq_SSD2.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work postsynth "${PROJECT_DIR}/stimulus/test_cyq_SLC.v"

vsim -L proasic3 -L postsynth  -t 1ps postsynth.test_cyq_SLC
add wave /test_cyq_SLC/*
run 10000ns

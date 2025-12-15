quietly set ACTELLIBNAME ProASIC3
quietly set PROJECT_DIR "C:/Users/Monica/Desktop/J3121000001_Comb/J3121000001_Comb"

if {[file exists ../designer/impl1/simulation/postlayout/_info]} {
   echo "INFO: Simulation library ../designer/impl1/simulation/postlayout already exists"
} else {
   file delete -force ../designer/impl1/simulation/postlayout 
   vlib ../designer/impl1/simulation/postlayout
}
vmap postlayout ../designer/impl1/simulation/postlayout
vmap proasic3 "C:/Microsemi/Libero_SoC_v11.9/Designer/lib/modelsim/precompiled/vlog/proasic3"

vlog -vlog01compat -work postlayout "${PROJECT_DIR}/designer/impl1/cyq_SD2_ba.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work postlayout "${PROJECT_DIR}/stimulus/test_comb.v"

vsim -L proasic3 -L postlayout  -t 1ps -sdfmax /u0=${PROJECT_DIR}/designer/impl1/cyq_SD2_ba.sdf postlayout.test_cyq_SD2
add wave /test_cyq_SD2/*
run 50000ns
